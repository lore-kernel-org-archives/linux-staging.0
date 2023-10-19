Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D463DF;
	Thu, 19 Oct 2023 06:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iz+5zMS0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso2211295e9.0;
        Wed, 18 Oct 2023 23:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697698523; x=1698303323; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sxkw9J6vbuDa33oyWmJKA2N6BRhlaSDTP/vmMSE0zJw=;
        b=iz+5zMS0b7ZLhbtRh1ivueFFIV3uI1NPdZKknAnZi/6mKWOoSuLslINIcpkiHvkiX6
         KmzcP+WQsyXHiGKIwduqKnEReKQmKBgGKqN/8o/EkngWUszC50qaHLMY1XBI9J8cQX38
         utTLmu6JP9mIoAgxFJoqixgTmIJdhqEp+Te+7j5lNBH5KWqxOgEwca2+gi55rpbXjphe
         4p2X91s2l7m94PX64uQBIEB+YfjIeL3fDd3BTIVOoZowoNu3N9mawBVJT2XYA9lvubJL
         TDFMs3Yub1VUBHwD2iqbtnjIb/eRbUPf6sjgnRJLq8vnuIsVWsi54IPSaKDCn56w9gHM
         m7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697698523; x=1698303323;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sxkw9J6vbuDa33oyWmJKA2N6BRhlaSDTP/vmMSE0zJw=;
        b=AOY50QzofmByn2CouoIMGvXIM98rMQrIiuZPR7LyyZzktlZeedzIHIAEl+VhW4bW1c
         zpAdScEG8RHo1DQxLdWQ9reemcKAtZ1lRGaJhnHgvdphwCV4v3X4hm/p7nsAFep/u8tE
         5XnqcCzSH4uuOqyFG0w6m0oIzev4H8LiLCNACDlihs7vjFEopXy1uOx25rHMyrGBkp3a
         Wje768vmRlZRd6RWq0T302jKrwjGTj9EgoZuDjEAFCsjpUk+il+DxDoq21vSnd+gQHQ0
         GzPzPxOz8DnkKgBEvA9q0YhXv0CvtEwfwmNxUUNS8JIVIw6Q3BPkISnNb86lNN91dPpL
         312A==
X-Gm-Message-State: AOJu0YzRlCe7HdYF9Q6/0SyLkqn6WcWzPAKFdM49S2C+rleqBscHvSqg
	CcjsNEBbNb0COzJDFkU8g1U=
X-Google-Smtp-Source: AGHT+IGtUrfvTZXm57cB6L9weG+na/8FnIH2RYJGQDTaTpfTbY8L4FAKYCDw9+cTc2AXH/zOWgGATw==
X-Received: by 2002:a05:600c:1ca8:b0:405:784a:d53e with SMTP id k40-20020a05600c1ca800b00405784ad53emr740376wms.20.1697698523166;
        Wed, 18 Oct 2023 23:55:23 -0700 (PDT)
Received: from lab-ubuntu ([41.90.66.104])
        by smtp.gmail.com with ESMTPSA id x3-20020adff0c3000000b0032dc74c093dsm3713492wro.103.2023.10.18.23.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 23:55:22 -0700 (PDT)
Date: Thu, 19 Oct 2023 09:55:20 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v4] staging: vme_user: replace strcpy with strscpy
Message-ID: <ZTDS2H48JBUTiwZi@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch suggests using strscpy() instead of strcpy().

The advantages of strscpy() are that it always adds a NUL terminator
and prevents read/write overflows if the source string is not properly
terminated.

strcpy() lacks built-in bounds checking for the destination buffer,
making it susceptible to buffer overflows. These overflows can lead
to various unpredictable behaviors.

In this specific context, both strscpy and strcpy performs the same
operation without any functional difference.

The reason for this equivalence is that the driver_name string "vme_fake"
is shorter than the size of the fake_bridge->name array which is defined
as 16 characters (struct vme_bridge {char name[VMENAMSIZ];...}). Thus,
there is no risk of buffer overflow in either case. VMENAMSIZ variable
holds a constant value of 16 (#define VMENAMSIZ 16)

The null-terminated "vme_fake" string
(static const char driver_name[] = "vme_fake";) can be safely copied into
fake_bridge->name using either strscpy or strcpy.

While using strscpy() does not address any bugs, it is considered a better
practice and aligns with checkpatch recommendations.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
Changes in v4:
 - Added a semicolon to mark the end of the strscpy() implementation.
 The semicolon got deleted accidentally while mailing the previous patch
 versions.
 - Added the patch reviewer.
---
Changes in v3:
 - Rewrote the commit message
---
Changes in v2:
 - Make the commit message more clearer.
 - Remove the incident extra line change.

---
 drivers/staging/vme_user/vme_fake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 0e02c194298d..8ab5b43c70a6 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1091,7 +1091,7 @@ static int __init fake_init(void)
 	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
 		     (unsigned long)fake_bridge);
 
-	strcpy(fake_bridge->name, driver_name);
+	strscpy(fake_bridge->name, driver_name, sizeof(fake_bridge->name));
 
 	/* Add master windows to list */
 	INIT_LIST_HEAD(&fake_bridge->master_resources);
-- 
2.34.1

