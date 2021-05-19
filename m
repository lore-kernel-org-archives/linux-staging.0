Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090C572
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 13:42:48 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id m124so9461951pgm.13
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 06:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yVZkSQGihBwShgl8HOq8FcajrTqG1qrxRHeRqHbeMSU=;
        b=SLKlqLGMLkBhmW5gMF03+rdrAx0M3nrAGIRv/iBBkmdArqbh+McSLRGuGrb5vwrp31
         DWtSZA0zNXOBWHGYNfwQHyB0JEkbngSqKKeYfq3TEDsIFz78qGMuixk+kXt9Ss6AXAkP
         MjNo4Ty1Ki7m2ZoHxqYRPy6KDSKZ7Ro6Lz5ij14jDJGlzYv99zQT0kQdkxHG+cmBh8Xy
         lnx3S1cKHRmRcGojDQNaNUthJfoQEEbltH5Hnv6nBSCfScULeOsgw6yMR5CGjLIl6qPc
         oSGhvgPYUblYr03G+Cj+tBs3lBJtCmFgGdo7Ic6Uu3P8vyo8s8TS+Id7xnhdXknkfmDD
         5G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yVZkSQGihBwShgl8HOq8FcajrTqG1qrxRHeRqHbeMSU=;
        b=qM8Hef1Ba8MDNtdsuQm8JEHHZ//fqcKghJV82lRtxisyAMO5LPopPKxYqQnbWTzqsi
         iV6YjUe3aIu0jC7dpuVrBC95S1Ewh59joSXWg6vv6Ikz+2s2L9PJqNGochSbxtMn6qJG
         XO8v3coAL/4VwwEx3N76EAZcT4Pk69eadAKjv60xRqP6eD7owAAfkSkiN6J5wgy6aayi
         t2uIFIsbxSjFcBvzuv4jS04hfZNtEzGGN8kcNuMRR1rjEauTAFrKejB6D3zBa+dV1Vzv
         vK8I2ys/dCuhEgMr7TJVErQhthOU5OUURfwFDnQ2RY7c2gYffJP8T4xqFfanjeBwAnno
         jkiQ==
X-Gm-Message-State: AOAM532KDLaJnvaRyhF0f5Fw62s11NGl/YrvOcnSKEdTP6rvpIbMIXHl
	l8z9DKG//z+REO7EJxPk524=
X-Google-Smtp-Source: ABdhPJyyYycNawXUBSpqS2VP+cIaEk/TWkpmsGe8wDcN4X2qrAOe1ATcX3vn37nW8DMtlfhyOJjk0g==
X-Received: by 2002:a65:640c:: with SMTP id a12mr10973519pgv.229.1621431768522;
        Wed, 19 May 2021 06:42:48 -0700 (PDT)
Received: from novachrono.domain.name ([106.214.255.120])
        by smtp.gmail.com with ESMTPSA id q24sm15470387pgk.32.2021.05.19.06.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 06:42:47 -0700 (PDT)
From: Rajat Asthana <thisisrast7@gmail.com>
To: dan.carpenter@oracle.com
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rajat Asthana <thisisrast7@gmail.com>
Subject: [PATCH v2] greybus: audio: Fix sparse warning.
Date: Wed, 19 May 2021 19:11:19 +0530
Message-Id: <20210519134119.848055-1-thisisrast7@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519102947.GU1955@kadam>
References: <20210519102947.GU1955@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse complains that:
   warning: restricted send_ctl_elem_iface_t degrades to integer.

I have looked at this code, and the code is fine as-is. Normally we
would frown on using the __force directive to silence Sparse warnings
but in this case it's fine. Case statements can't be made into __bitwise
types. We also can't change the type of "ctl->iface" either because that
is part of the user space API.

So just add a (__force int) to make the warning go away.

Signed-off-by: Rajat Asthana <thisisrast7@gmail.com>
---
Changes in v2:
    - Update the commit message.

 drivers/staging/greybus/audio_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 1fc7727ab7be..1e613d42d823 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -676,7 +676,7 @@ static int gbaudio_tplg_create_kcontrol(struct gbaudio_module_info *gb,
 	struct gbaudio_ctl_pvt *ctldata;
 
 	switch (ctl->iface) {
-	case SNDRV_CTL_ELEM_IFACE_MIXER:
+	case (__force int)SNDRV_CTL_ELEM_IFACE_MIXER:
 		switch (ctl->info.type) {
 		case GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED:
 			ret = gbaudio_tplg_create_enum_kctl(gb, kctl, ctl);
@@ -903,7 +903,7 @@ static int gbaudio_tplg_create_wcontrol(struct gbaudio_module_info *gb,
 	int ret;
 
 	switch (ctl->iface) {
-	case SNDRV_CTL_ELEM_IFACE_MIXER:
+	case (__force int)SNDRV_CTL_ELEM_IFACE_MIXER:
 		switch (ctl->info.type) {
 		case GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED:
 			ret = gbaudio_tplg_create_enum_ctl(gb, kctl, ctl);
-- 
2.31.1

