Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984503D6CCB
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774893021; cv=none; b=ZL5VHy1Kpw4+kpL+NJwhXMUU9RGJg8/SNgPjuLRgYhFKAo/1EWnU7W0Vh1v0cKrWerRTDHmAMtD6CSHvwXTUMxkJ82ozG6VYA8CzuRpdsRh2CpuvZzpFfU4nu/NdBUDkoqOpI0lz87bHnuYmsSLA858hZik2ttXAVXJNkITwmEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774893021; c=relaxed/simple;
	bh=bYYzZlnkqWt+TfCCh2WfICIUcGHEozktL+gvrMJj/GI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OTnsFDzwwlF49Gby4VMG0Id4qo/uljyce6R7vCkL33LOpxCOHghIvpwmUsOUWQOdVR5+j6AjOYjdK/pN3p7h9udMFbIOFcHMFleEtUnmLq8RMpdzesiVKZQPMhIPyi4dJKC2TPbiE83GaT8jUTvtnJ/vK9c5RHVtQkvOLWk6Cp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBf0gnah; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBf0gnah"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so46066975e9.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774893018; x=1775497818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYYzZlnkqWt+TfCCh2WfICIUcGHEozktL+gvrMJj/GI=;
        b=iBf0gnahWO/2srOQxJsEJ6Rq7IXVNfmsLl5xyYZm3YgMYDTdVZBkskMOB7aC+ZEIB5
         f1OYYdHhJGw8oIuXK8gLZNtGyjBeX1KFHekVfqCIbCiJm87Ea9GjAbt+Kq2EVKzujS5g
         HHuV6OrpfzVY4DVHQwZb+evdvjSc29qI6wyOwyzMcw3a/8wgITUtQSGn+nuMIEAraqFv
         vkZiHMeRcPiARqHFOiuR3A6zZRk/I1x3NH7MhKsxKBoRQxIjrs3mVZchE/77P3IWLiU+
         o1CdF5kBWR04ci50rVluGGuT6Pzn5FcXEpsX6o0HDdFWy3xgy6YKQKnow6nC5I1BfJRT
         4eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774893018; x=1775497818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bYYzZlnkqWt+TfCCh2WfICIUcGHEozktL+gvrMJj/GI=;
        b=U8dXbhdAQLbEbWoBahyLKjzN01jBKubF+20G6khlXNdcSWRAN4uNqTerGIgPwcafKX
         wyadbyue8o/F3BLb1tO8LruhPdP6q3omrznb2CntCuBG+ne9PcPkFz85f8BVdJA8FFai
         dnS+YGdB61r8KJD8RhP+JtM1rdbb2h2xe1ZqPYLG9ACk0kJKP532HOsp8vq6XedV/HUx
         Vgo7df027c16989xMBvGxCXxnDn6e4g9PKuD27IVDeeYD5IlxnaqueVL6ywT7AcvLU8f
         t7zgQ/WT4D2s4rQ52BQOcg4RV903TylK0IsWBThR+IkqV7KHLw0dPKzjsizlw///CWvF
         tplA==
X-Forwarded-Encrypted: i=1; AJvYcCVnnDdo6M1yO0X39b1dbXXSf2w1m1SNFlznM0YAOXxXxoNGy46VIWlYYy2kXD3/7dpCE1/hwz07cVQggBsa@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfo4smOBbgHgjHTaxF5/K5S7gGo6OpvHlayTXfh1Q+EK+u3InH
	xC4UJmn099reyd0yolehlzuD3oINHZSyM3cjghB2nLfT/3L9tG4eNQlv
X-Gm-Gg: ATEYQzyOXnhgUBjvFf0sU2A2QEvz+R3iRHupDOexoKOYig3vVwbX9CRXoXTMXGTWekf
	Jm+p0bKnYluFJ22SnhdOInQp5CFZQoSKfxg83/NMcoYRfqc50jxkQ07wEdPIJU1D7+gMHe06cLV
	BakKNa/1xqjC0f7LqP1/9gSodOAHm7OdTlyWxnYsqB5GUdlwVQaOmSr9gwf8YdVTNesgFwBUWPJ
	PTaFw49aLjZAUhn0UfxzrxrWEGNKLb6otNm0cBY5tfTlhCrzSSlz3jum2w7XNB/rBKXp0zt1Jyh
	SXtfEGSNLNH2XMMJHyPPqyeKCPmJY8ptOU7cUqDhUenKT6dgLBpOea4rBkrWxoGN5m2ksNScuB5
	uCQO2C7b5pNQvKJ1z4oQOm0+Zg9QZPCIW8RC971VQtHqYlysa52FsiHfKPAI09buWMIar3Ilv6A
	mCQ20fkKimSXRLtTbDVfWgpB1ow/Cd4DB2H/tOct0Ls10r49V6w3zljQ==
X-Received: by 2002:a05:600c:b95:b0:485:5c6e:8a38 with SMTP id 5b1f17b1804b1-48727f63664mr213573905e9.17.1774893017785;
        Mon, 30 Mar 2026 10:50:17 -0700 (PDT)
Received: from MacBookPro.localdomain ([2001:8a0:6c9b:a000:3437:41ca:45cc:e6f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d2366dsm290145375e9.10.2026.03.30.10.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:50:17 -0700 (PDT)
From: grondon@gmail.com
To: gregkh@linuxfoundation.org
Cc: christian.gromm@microchip.com,
	parthiban.veerasooran@microchip.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: Re: [PATCH] staging: most: dim2: replace BUG_ON() with graceful error handling
Date: Mon, 30 Mar 2026 18:50:13 +0100
Message-Id: <20260330175013.32985-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <2026033011-limit-cherisher-06b1@gregkh>
References: <2026033011-limit-cherisher-06b1@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

On Mon, 30 Mar 2026 17:57:23 +0200, Greg KH wrote:
> This should be one patch per function, right?

Yes, will resend as a series with one patch per function.

Thanks,
Gabriel
