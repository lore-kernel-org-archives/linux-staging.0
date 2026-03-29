Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8C52F39B5
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776945; cv=none; b=KBcMaoK3kAFw4rEpEx9WKyAvMS5Xs77dxc7hgZYZXVXyTtnf633/b9fkf3lqB18oACrmWZ8MWBwZfwjRqdrVuG1Hbgl2FdryS2luCzA1+e1Dj/q0kgfrj/v8TYyEMyDSWDim9fh+fQaOYRliw+P57W5VTjG1Qa3DpIGrnJ0BYZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776945; c=relaxed/simple;
	bh=eUo6DVfc5a2omgLGLn9AzbyZSrNVqte5Xza6A8tCW9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQAjqBzSWr00J5xs8KRWlzrgpi9CMZ1u77wVGcrVplHAMU8SfhcgC4tN6dc7cDpLdKY2WFr/7iygikYWoiVNtIVwUJYxby7d5xRT61FIRkW74XNQWTIFuQU9vd2zAhenFbFyUntqR1IyIiQwo0emA/bNVeAi9NCEnOvdwKyyvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjNZtdUy; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjNZtdUy"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso27676385e9.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774776942; x=1775381742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYb+gaUT8XH4CX7IyfsCVTmw1g2c9zp8e5y2wzYBlLw=;
        b=NjNZtdUyVA4DrbOjMhXVXIIibEyOmVk4IezuhdJLwsRm4r7xTphkVx9DSKmparh9Sw
         sqHK+sCHy0KKxRwEsjL4Du/s6ev2dLAmT8D3ylrIveUeT30ASrVoNfl1UP1AXtDffd6K
         w9Fo8Kck5UnS7W4nK2Lw4TUxJUYrEUd232IsSsAzF1+519PGbS/6vRFTRkiWmD1QQw7T
         cSZUx2pjmsrdb5kJDwe7+RW7haQZ87PE26SLqxnGNQxyi44Rn/8d798K9pkCFZj6VvFD
         9oZnySA7yUfYmKhgTybbl5iTL+FagGc6UieqbUt9uqwZE1c8twogXpVTUva58hX0JRIN
         pc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774776942; x=1775381742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pYb+gaUT8XH4CX7IyfsCVTmw1g2c9zp8e5y2wzYBlLw=;
        b=JIY4uxLENdNWbARMUNCPYdd4w/bIsoKIfbfpT9N+n/EYd+4Rwv+KzdQRtHZxuxwQ4Z
         jeaILRUbQMlFpPx7lu/Fs5QQYv2KhNJ/on0vwawXLUaWHPoqhLhyXddgR2t2F4gF+aB6
         MRG9Nf93PmRrV7/tv2kH3Cz4ZgYLPkRUOUTZp3+O0dwQee8QDA4sB+mwapxo84NVytgf
         iLKgnE6rB2524dds/C6KyQ61BqELZUPVduYebBOgbgHWsVFKpOlvs4WDL78RdDjlUs9j
         UrbAC+vdEWxx9EvSifiJuw+lwXGatKEUcTGwVQ2NItgApibYY96VLpSK7/INm0M/d++b
         ZHUA==
X-Forwarded-Encrypted: i=1; AJvYcCVcYpRi2ckMyhNoA8o4ppyyy8hx6x7hrHbsrjvVXfx8YPaNpXgSpzRL1J2oQVe+VcYIFvcfEfLIb3UlG2mi@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr+2OGe7b8J6GsUu4zzgaXnRI5oyNlH4Zccy5BYH2rnFyG0ib2
	jP2IONe5gnyKbxkcNsPWgJkv4C7mhF1/okk/E2EOBf5/XzstcU5CevSz
X-Gm-Gg: ATEYQzxYMfyiGCJcRdpRb3quQ5biCqoR9eSRvn9NhXnq40+myIGQIc1c6Tdrpknsw0M
	1oCuKMvjO5LkZf4xbR/VSOVUYxtDOQfMy1fU3trYPCAH9nbaO6GEM6itYwaE1cxISVoms//Rw3a
	11e2u4hk1TSied5LxqLDFU2knGmj3fHAdCpdyDaYO6raPN8s2S/DSq1wUUo573JtU3cD2XcqN/G
	SiXgv6om+myOgdc7aR0iMfiYZR7HRveJU5FKs4/3CZUY5nV2ecKtksXTnniaBKahTn1hZ3wI6VO
	r7rENbzF6I855xBw3L68/gj37xXwp2J10N66rkjXjjcOp68DZECZiAFa6euzkNGPFiVhMNrnkc/
	+cYpFpENm+7VfeQ9L1B5gqNdyMVTq7phbTiq43N0dUzGOu6C5CzG0cxshmNoBviWz6V9772kHQv
	4OUmqt0j3dqSAuUnM2DvVz
X-Received: by 2002:a05:600c:8819:b0:485:3ff1:d5c5 with SMTP id 5b1f17b1804b1-48727d55fc3mr144928625e9.7.1774776941865;
        Sun, 29 Mar 2026 02:35:41 -0700 (PDT)
Received: from bera-arch ([2a02:ff0:c13:2eeb:2e7c:3a4f:2bc2:f78a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d40741sm206072335e9.13.2026.03.29.02.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:35:41 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: tommyguo039@gmail.com
Cc: b9788213@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	tommyguo024@outlook.com
Subject: Re: [PATCH v2] staging: rtl8723bs: fix CamelCase warning for READ_MACREG
Date: Sun, 29 Mar 2026 12:35:09 +0300
Message-ID: <20260329093508.11560-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329075941.60247-1-tommyguo024@outlook.com>
References: <20260329075941.60247-1-tommyguo024@outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 29 Mar 2026 03:59:41 -0400, Xiyuan Guo wrote:
> Rename the _Read_MACREG macro to READ_MACREG to resolve the
> checkpatch.pl "Avoid CamelCase" warning.
> 
> Signed-off-by: Xiyuan Guo <tommyguo024@outlook.com>
> ---

You sent this patch with tommyguo039@gmail.com but signed with
tommyguo024@outlook.com. Also add a changelog after the '---' and wait
at least 24h before the next version.

Thanks,
Bera
