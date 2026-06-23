Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22553C2B80
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 22:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252650; cv=none; b=Ha5dds9pFFoPHi1+Si2UnvnwQAl1DfbdykFlDbCXEf+1QHKrhenfuxnf309Pa8o5SqgqXkgWFzNwJxBeRQuJsNB/wlZ8EX63dDC4ZKw0R3BQp7uacXw58NsUm374moNPp8E1tOdNwPj0aA9oorbLzL44elwRnxnPBK9CB4oEy9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252650; c=relaxed/simple;
	bh=CLlY5yDoMSKTXAg15Hqh1YMdL5qX4NCHKFH0B5SFS6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bujFSWA3FbfssPgkuDIE4j+sntzGxPqqJHpamgPgYU8qCE9Ee5MAlzU+SGdnX3L5pD964VVwrYYDNIKTTiGUmcLMFhRrEoUEHjxXV7hfmzus+zUHtjOCU+hirkAKmCj9zrcwtKeWOZWDmeBjg1lyydSx3NumRq+O8z/9138PLbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVkyg0aE; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVkyg0aE"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30c591fb1cbso509048eec.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 15:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252648; x=1782857448; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfgVBc/XSNTUAUKRc0vevXswDdgkcM0JGJwtpxvQCG8=;
        b=SVkyg0aEuEgz75nCtxDdmj7k5oIxxjWnkyzb6GifstMwot0Gq3iTDPaaEKO4JeafwR
         ZamM2OxnvcKH7jIOf+AVdYLmAFmknU4xF9kog1vfDxKwrZvjWHHxDTJEG48/EgogRKcR
         nq8tote1DbzY6YgUhI/45EW4FygBqPxIp5oKvfO68J+M9Ey0gnzLuztboufliR8Uw3Dj
         O5BzfjuRza3qEgCWRB38QNP1cfDPUxOSqTSrz5MrAILJWrMoo+Nu2B7RXrBRobN/jRKZ
         5RiFqWAilcq26AejPz4Gp9AXC0fDmMLWURui4yKaQzdLISbZSXEFfo0nppJ3LuLtKvcx
         WTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252648; x=1782857448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfgVBc/XSNTUAUKRc0vevXswDdgkcM0JGJwtpxvQCG8=;
        b=XecXjNwN7/2q30h0tgxYoCWNg915DcA9CE4zyXXy5JQHFIcRvaSmx4CsyvVqajmOI9
         qhDQPEWGNFVjAYJ6hz1zruxmhP7kSqjW3TaUY/WE34MfcuH05kZYyTnu+1G+eDnqqg/x
         pQsOwh316aDHXmEHcyXIrt2/9zSFbHv3S3BsF8S4qIhyTHBa6qU3f/IxC2Ry0E9HJAO7
         iJtzlTnHxEgfWZJDBv1LYUUbpCbcETCdKbSvuKPTUHQ9YzzQ+Hcd10zEeUsPacgZHucu
         +e7+dlSiUljrj1iEVWEvC7E7Ncx6fKoHphjwA2UzmsDif0ovLwUyDV82lASvNn6aJTeW
         fCew==
X-Forwarded-Encrypted: i=1; AHgh+RpnGDMvKwKI2ErX7yaRE4E2orvzEHllDY8x6cZm9q6s71EVPMo0OiYdlc8GUgIUqsPwehUATYzMXAqnctbZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzudLfAqQkz1ERy2xVZ0NzqACq0NsaG+xZVf/IUXr74sEx0mTcR
	0J8LXPLWnUeyS8Pa1aRGo5NBcH+W3mPzf53IFZCoTDzoemkuZ961y5OA
X-Gm-Gg: AfdE7cmGDvi//sh0WjIZIrG3L0VT3jH/xO+gvFzk8l8rFOSNl6ysAXI64aMNtHzMGBt
	UF2TRC5y1JcLvgfD/8h0kcGRry3YRTjHzrJ7XOsDu2qRgTJ3NkdLyRnCPTUffi6Ie0KZbC+iTtk
	P00ybppNStsCB5niLQHb5cTvtrUfsH2c1LdRPK0yxtT/L+ftB5g13WoqiFyJqrFtT702Fz5ICAj
	FQ0/Kg6xJ8hOlQBkMt42Jc0XREMn8FgwyUVMRCuvZUBNl2CXTg4qt8gjiw2Vvv+fMO+xTp0om4/
	xxn4eIki1AKpZL/XbximdEjCGeaL4Rh74WAE1jQnpCv8iS/SzvTR5OzNJFSmU0j3T2uON9BT0yq
	Jbg0qZv2cZ++0Cxh71dg2y3iyjNA5iXS2bI1HSYfVQKNk+yYykTlEOGHGA47s7bHBuyS0jS2JlG
	5++FiteyLAbkY/4b9N1OEEq26NaRBt8CDpYvwPC5TUij9NARza2pr2g3fNYpWo0dbNZpc=
X-Received: by 2002:a05:7300:214b:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-30c68ec5a61mr1210948eec.34.1782252647728;
        Tue, 23 Jun 2026 15:10:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:c10d:2699:12a0:58d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5178a68dsm9059903eec.22.2026.06.23.15.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:10:47 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 3/3] staging: media: atomisp: drop redundant out-of-memory messages
Date: Tue, 23 Jun 2026 19:09:28 -0300
Message-ID: <20260623221028.40238-4-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
References: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On allocation failure the memory management core already emits a
detailed warning, so the driver's own IA_CSS_ERROR("out of memory")
lines add nothing but noise.

Remove them; the error handling itself is left unchanged.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index ad2a9b84e232..c0102056d421 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -25,7 +25,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 
 	dvs_config = kvmalloc_obj(struct ia_css_dvs_6axis_config);
 	if (!dvs_config)	{
-		IA_CSS_ERROR("out of memory");
 		err = -ENOMEM;
 	} else {
 		/*Initialize new struct with latest config settings*/
@@ -52,7 +51,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 		dvs_config->xcoords_y = kvmalloc(array3_size(width_y, height_y, sizeof(uint32_t)),
 						 GFP_KERNEL);
 		if (!dvs_config->xcoords_y) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -60,7 +58,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 		dvs_config->ycoords_y = kvmalloc(array3_size(width_y, height_y, sizeof(uint32_t)),
 						 GFP_KERNEL);
 		if (!dvs_config->ycoords_y) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -72,7 +69,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 							      sizeof(uint32_t)),
 						  GFP_KERNEL);
 		if (!dvs_config->xcoords_uv) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -81,7 +77,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 							      sizeof(uint32_t)),
 						  GFP_KERNEL);
 		if (!dvs_config->ycoords_uv) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 		}
 exit:
-- 
2.48.1

