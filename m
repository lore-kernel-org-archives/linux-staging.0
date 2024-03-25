Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C858E3DABE2;
	Mon, 25 Mar 2024 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388868; cv=none; b=YNbHDGCr3h/A0z9NG2nkExYz5FeB4+7eabXRSlmSfoXlf2cfu4aC9siH6Qp9TJa3nuWQZ+9bC7JthTv0CEj+7wiff+IaJwhvDtqqZCVgLCuwhHtLh3i3o+d/wbjQDNyAHiYztAdZSAUNtWVagxl9IEhzEEQBstMe/YkZoq7MBUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388868; c=relaxed/simple;
	bh=x79bQNpuZSSP4gO8yikz0VUCiVgrNxK4tK/sdFtNq40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=npbxLBu5dGonfjXqfa0V/C960SGzI/n0duRHJUoCJGK/xnXcQcBgELGFEpn/UD3q9o4joZJgIYykQOdU0gVA+Ui2ikkO0g9mMIyzmkJxu7HFFm46emjg6w5gsOyZeehdCPUNsZc9A7iITZzlCPr3KAhBdCY+DyxL1l4W4BLUo58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3PxjQaF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3PxjQaF"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e6a9fafacdso3484998b3a.2;
        Mon, 25 Mar 2024 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711388866; x=1711993666; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mEPz6M5iHmHoPmbFs3iYprvWP2TggHiaslNWFi8OZW0=;
        b=F3PxjQaFcIvFiYAYXg//BZ0sGKl4WSBNk5UBhZNnQyZDehpS6M2HjF9wvjIy0IhZpM
         tGGkQDbCbi5U2LqwXLpJZkM9sRZIoE0ntBiIvvf14fnd3la6Zo1sTFkX1moP7lVotnY7
         pk8oY58mg2JhRtkMYpt9lUUTpBeNSQkuoE2L0YD1vJiPiE4MBeFBAp8giIdx5zqEQ6Hn
         /nEGJ8+fci0rM1NVtWdmRrb0h9BiDoP8jfJp6YDA4M0joJKPIVfM8NLa4osAhH2DJEmg
         rTfppWbYjYZ+ivIcIofImKJMhoyBq1aO7oWPSLkvNf5yOX2cffrAp8ytL5J8Xau35yUo
         wL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388866; x=1711993666;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEPz6M5iHmHoPmbFs3iYprvWP2TggHiaslNWFi8OZW0=;
        b=NHc9jAyt5oRLqrq61u8waKHaoeCKNaF/43PzqzuJUyNGwMjDYpdC7i+nNFQWW/xhMX
         C6S+LCN1zdnROizuLJc9+Z1VtD1Adam/qZ8tzn/OczsZg/Eb69c9k4JWbd2lTvfqGbaQ
         A3B/cCFJnE3HOK250p5KCEVJVIF9nAxhtN+KDn8V85Z+i2Eg3q5c4tcc526efRmwBixu
         g8qdADz15btpQKLWIuda8sr4kDaLR2N3AxRGwcanFBNaKj53+Z4fmxWD4o0t+FXOw09H
         EdyrRg8kYygQ4X1ONR27gQ7EIXPyGsts3vmJcivPe4/cm49hyYBrjCyMp39jlVZGthvV
         RNnw==
X-Forwarded-Encrypted: i=1; AJvYcCUz7GrxkmAKiPUxSaRCyiequVuBiEcJkQmNox9GzwJLzluOKnla9cha8I4T3g668v5n1u0nUNvK/whJNyvvyD+2iMFf5OlmZVOIHk2pKw==
X-Gm-Message-State: AOJu0Yzm4iwBVblJ7rCU4B6DLwOSMPTToqsyRm6g3v1MvgHJruL9m6lH
	nggdb8a7sCs555BHztsNPuBi4NaLavJjuNcjGWXQ6ts4MEGtIVRlOI/AbibLqao=
X-Google-Smtp-Source: AGHT+IFGLoJ906tIgvVPhFldOKi+aRwpKUD3HGt3rUE/+t7NYeCllhEhK3pUP1gIHVT2SA4qZU2rjQ==
X-Received: by 2002:a05:6a21:182:b0:1a3:b034:ca42 with SMTP id le2-20020a056a21018200b001a3b034ca42mr8109908pzb.40.1711388865962;
        Mon, 25 Mar 2024 10:47:45 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id k6-20020aa79986000000b006e6b415b405sm4322581pfh.36.2024.03.25.10.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:47:45 -0700 (PDT)
Date: Mon, 25 Mar 2024 23:17:40 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4 0/3] staging: rtl8712: Trivial code cleanup patches
Message-ID: <cover.1711388443.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Address different kinds of checkpatch complains for the rtl8712 module
to ensure adherence to coding style guidelines.

v4: Update the changelog to match revision history
v3: Update memcpy() param to match new name backup_PMKID_list
v2: No changes. Just a patch sending error.

Ayush Tiwari (3):
  staging: rtl8712: rename backupPMKIDList to backup_PMKID_list
  staging: rtl8712: rename backupPMKIDIndex to backup_PMKID_index
  staging: rtl8712: rename backupTKIPCountermeasure to
    backup_TKIP_countermeasure

 drivers/staging/rtl8712/mlme_linux.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

-- 
2.40.1

