Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9743ECBE3
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526845; cv=none; b=dO8UA1cTfUT8vkghQc63XLWQ+OQ0WdG85ADV0bJ6PkwqswTYVkTLKo3aMYPkI0lUCk17HPL+ai1D20qVhSaUb3vxHtLJkhXjslfSbfHpd3eBb8Axh9jVxYlw7Gv2YACgUV26OpUZp0VRAizUnTqVi2n9y0mLMU8WxVT4U7MKMfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526845; c=relaxed/simple;
	bh=8gCbaMkuN0MtHETETHWlrA1CakCRNOnhZ7D/tMDxDj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sj36fvpchtN60KVaHFE0kdExQbQAe5vTknirVUvC1rFwdf+mVxtSPtrUSlOW/NY1m22Zjqp6sqKq0UMbjNBGOinyobGfzFcPoePWFm/i4xYAfzpg0b01WnjLmU2sVrUyb+qEIjgo5kNbiNo/i2HFsN6lZtqoo2y6QO9QkNzFxXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj8nobbG; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj8nobbG"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84a2c90e383so1522876b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786526844; x=1787131644; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8gCbaMkuN0MtHETETHWlrA1CakCRNOnhZ7D/tMDxDj0=;
        b=Bj8nobbG1U2DbwRqVSYJe9wu254BuKzY1yzeDnPdLVozLCYJ0r9FWMgBzR+t+FToHk
         dHe0wfRtj0Xzw56+pi0FA2ftbYP99nfqbdignc9O5C2bCDEqz3byBUXf4wIKwqUgWR7G
         u3cviI54eqAKoiEd+JK2FYp2eDyaS60c0KwzCQ7BNsuNQLGYosvLJkDSEEwz9ovOLb8V
         c7xYz2W+i9SSEUKeKAoemATfJT6YdM9r2AzHTBJMI9MCoDVM4afMCrQdc8O8c2i/RsrY
         xwPOdhCD4XS+YwQyu90jevRCUkDjeUktILhpTR5IvtKBN1y+9gbXxAJSOz/VKk8HA2x1
         5tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786526844; x=1787131644;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gCbaMkuN0MtHETETHWlrA1CakCRNOnhZ7D/tMDxDj0=;
        b=DLdiWoO+Knp6oCe8ZQNi9ycXfhjCFjaCQePtDwevd3lpvRGYFWkTOhqP8BS2lE7LgE
         Jki8JI4H68njaz63evVgYbhGVDiQ0DknimMZTQw1AtIliO07lYAIOqqN/SDo73FAzTwP
         5crapZknT7zqxXb4of3oRmALwg7vmiHw7x5OZxAS1/nTCgWPIqj8GT2wJNSyiu94PXDZ
         rmtdYgLHcpJG/qozPIBR3zXQpOnXgAMhncKSQiNyN/EeLMPta67wUJ0Z+aWknrmNWD9p
         MhfeOjmkSux43569eHGW5N3iPPUIiAURG9v4H8sguV9CFhBqcEZRs3v7rsYHN3zOk841
         XB/w==
X-Forwarded-Encrypted: i=1; AHgh+RqaTcePNGCTgtO3LZtiNEP8Q8eZruLaRiCEIqJ/h+sG0vxOwqDB0j7A6i84zlku9yc5uke/BuykbP/uIlpG@lists.linux.dev
X-Gm-Message-State: AOJu0YzRx4fjuhaQhRxfhCZ7XpWDnFx9cDem7MvluhUOJwnlglxtm59X
	Iez3H8ICb8L/Z3qdxXfjq1SjOeDQ+Kslygew2f8dHumgINQpFjeoQnfJ
X-Gm-Gg: AR+sD10pERRn/j7hD2NDOk0a9D3OuJiR/zmJTq/c0q/jlKVmg7Sc03kSzd3NGAqkfAd
	BLwyzWAZA920twyRA7TA92pkGXY07blT/80cgK00ZJVbr5s0BP9ZjHnCdJefeFQPfZoJSHC3u35
	KQW68C3Wkg6GJqo2kdCaE5P99x2mTDnXrcu3Zno5bz8XXtFiNCvALuU5PZHGcUMYjisjLi53kvw
	MitQEX/5DM0jRNqnTk3cSQLK9t+JMl4Vktssrjr0TnuMqBpgK92rcbmjSX0IiZEvtn9ws4lUTeV
	MLxcFdqFCCREdHWqU7FsUdqti7YObeTOVGP1QWna212IJAocU4xCU54yAJfhq38CKafUA98j8Te
	yILd7aqv7XpFfLPF/d5x8o+fOu5ZYHP/OaC5QolcjnFZS2Gbq32YLaQ4TRBBNUI5T3FYbh/AY/x
	R5iTU2EZC3uvMgAjJXqeR2sKsKrLqjZN3Wry0kpKDumMW++Jxuuh/Je8dUP7GDZ4kqetQ=
X-Received: by 2002:a05:6a20:72a8:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3cc37a386d2mr6505850637.17.1786526843629;
        Wed, 12 Aug 2026 02:27:23 -0700 (PDT)
Received: from localhost ([2401:4900:83a9:ec61:7129:9a57:4b26:1066])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14124451180sm7399961c88.1.2026.08.12.02.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 02:27:23 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newline to sysfs_emit() calls in audio_manager_module.c
Date: Wed, 12 Aug 2026 14:56:27 +0530
Message-ID: <20260812092629.110389-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <PASTE_MESSAGE_ID_HERE>
References: <PASTE_MESSAGE_ID_HERE>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dan,

Thanks for explaining — I'm new to kernel development and didn't
realize this sysfs output format was already user-visible API. I
understand now, and I'll leave this one as is.

Thanks for the feedback,
Raushan kumar
