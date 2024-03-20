Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1ED4F8B2;
	Wed, 20 Mar 2024 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710969912; cv=none; b=McLhD+Z1e8xVRAcPj21x2jGJ3FeOBoFbcWE2wJmxfIhVplq/URRsVktv4PZm2Zc8T6tc5isWAcg2q6YBlAHT2QnfhblT4gjrnJ7v6Y8UStfPT3avk4C8jUgOq37oBxeIorLewPuNK1hDu/0AbHfuZkHRFiHDmfNdUSkWCk5QyuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710969912; c=relaxed/simple;
	bh=wd1nYr8m1KR2n3urOxGOjtHYYjJVJHI4iyGiHvDBp6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PMVCZsDfV/W5N+7FCey+bo35eO9NcmdIGMqLId6c/QKY5wlth3cifkkhP2TO7T9IIExKQIQzArvpszz+RtbxENfIyJVqzuaPDnpW40qzreBsnmCudCfLFArSspAK9PCM9g8uzuYO5XEIi21atipouZsjlbYR8Xkg2695GQQ7ag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qq4nfZCO; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qq4nfZCO"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6f4ad4c57so317666b3a.2;
        Wed, 20 Mar 2024 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710969910; x=1711574710; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7fFGAwFervR59ppe1kqtK+ZKXlEJIswmFJJz9qkT1I=;
        b=Qq4nfZCOflPHNEQ/TBPl7o9vyGRwxkFLMmYSVOgAL4lc1LKTFajCnAJtQNwY6E8Sv/
         BVLKQbgaunQ20iDJzwteJlBI4/l5Fb/fYFxLtau+45A4Gxgmfp7Qpdnhn2wPNqVnKi+p
         Xs3pLPF+iZE0Bl8LKYN0w3iFSF9hiZuBpwA+eaTn8EhBz369unKIZ+wMBQIqFBZzY2JH
         3OfWCrrchlriI9wSE9kId1V5GjbEdyLdp8dxvN2w3M60cg1P4x7hiVKT+KEP610eQFqZ
         f5waYY0bXRIfu4fUBLzTVQjgvrocor4kwflxKVAfZqmcwu82ys7D8yX5M0vl4I5cPbWe
         M5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710969910; x=1711574710;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7fFGAwFervR59ppe1kqtK+ZKXlEJIswmFJJz9qkT1I=;
        b=H2KABQl2HFB+RVODJwfRyNtI3WpPMfq0dsS0uHcuDDdHvWJSzRddAjhOaHJ2sN7tZi
         c1gnM/mxFCMpFjy5P3T3SEcqGlqksPouBmtw/o6WCtFo07ZyrpONn5zUgZ5BsssdfMfn
         WFZYR1Xo62/dQ2mjXvN9uaHNcFDCR2RB8tfXkjDPlu3u57L2n1085QG4AffcVptDVBcg
         4anUBJpXKf457KtsCJF7JL/XMZ5M9v8BPvrqciv5+2luvkj6qGpARgouhY/2fZx2A4dW
         /xYTfGUvVsNzAFgI5GDyzr+nB4dP11UWH2iNiOf7BzcIyl9ueZDE+Fay9d/CaxTkcYVZ
         Kpmw==
X-Forwarded-Encrypted: i=1; AJvYcCXapSmn19VcJukUmjycu5kt8y8bjc4R0HPWy+3g/x/4M4vZQPeiNQ4RwH3a+z6it90+4kqvjAIJVH3n10F3I2+RWbUL8mw13B2lLP58XQ==
X-Gm-Message-State: AOJu0YzzhLVkaILdkpYKpxyww/il1Y7BJMn35fewe/97xyFwDTLdlTqm
	BFzPGAZd18IKP/KxLH7id0m7l4nSJAwi7ZbTC64b/nEH2WpSaLua4EzgERDn+fw=
X-Google-Smtp-Source: AGHT+IH2iUmTzhbDC2TmnDtaOhfOaTiy54ieMvi2ChxgK6MlFkCA1hhh283Kt/vMNF7Bll4ocq00jA==
X-Received: by 2002:a05:6a20:72a4:b0:1a3:72a8:b7ea with SMTP id o36-20020a056a2072a400b001a372a8b7eamr7697543pzk.39.1710969910002;
        Wed, 20 Mar 2024 14:25:10 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.67])
        by smtp.gmail.com with ESMTPSA id f5-20020a056a000b0500b006e67edb113fsm12116691pfu.219.2024.03.20.14.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 14:25:09 -0700 (PDT)
Date: Thu, 21 Mar 2024 02:55:07 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v3 0/3] Trivial code cleanup patches
Message-ID: <cover.1710965653.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20240320212507.BL1KfZxoB2XSXTB7qZvOdClPfiMlNWK6_jHXpxqyNEc@z>

Address different kinds of checkpatch complains for the rtl8712 module
to ensure adherence to coding style guidelines.

Changes in v3: Fixed issues about backupPMKIDList and verified with
CONFIG_WERROR set and built the kernel.

Changes in v2: Checked any possible reuse of backup_PMKID_list
manually and rebuilt, rebooted the kernel and loaded the driver
with modprobe.

Ayush Tiwari (3):
  staging: rtl8712: rename backupPMKIDList to backup_PMKID_list
  staging: rtl8712: rename backupPMKIDIndex to backup_PMKID_index
  staging: rtl8712: rename backupTKIPCountermeasure to
    backup_TKIP_countermeasure

 drivers/staging/rtl8712/mlme_linux.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

-- 
2.40.1

