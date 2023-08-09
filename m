Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C6F8BE0;
	Wed,  9 Aug 2023 12:47:28 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-56d6dfa8b52so2739865eaf.3;
        Wed, 09 Aug 2023 05:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691585247; x=1692190047;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgLnNTyUqxgdIBRnXZkONE83fOCISV+cZafhjFByJ6s=;
        b=UgkCM4qxu+uMbk49jGT/byouHYOa4cv4oHh73ITQPbDuXUdoDmlxBEMDj8GE4XxWU5
         sWqqNVVkYn3vTMSbAgGvUVEMtW1e80xAlbTr72znfkhB7sbdhiOOogTDq7ZYyUYaPNfp
         JYEPqSAB/Dkf5C6ek+iVp3OhlCkb2ZCCGxpjL8DiOGVeSgcPBOnox1XED6TDreA7jpgl
         RYwP3ANO53FUuVDzdCsLw3m4DdntADVXHtPU3nW8jyi0bP2JInk6kG+FZWY9EqRGPdYE
         HMbO1VmckcHWj69SyMxpiY0YpcAa85VCi95nzAOZaX6o7WUCooNk/nLMnjrgRDtaoj2t
         Dfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691585247; x=1692190047;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgLnNTyUqxgdIBRnXZkONE83fOCISV+cZafhjFByJ6s=;
        b=ZiaOGCioPTwHlIwtt2KfTFC5/7C17bmUt9AZyZTlLkVJHx3acdCQDW4Cxubx8aVJnS
         SeZYZsc9PRqO0YkXUe+HFC/ENafGBKv7Mz1SfYe6qoSLzG66PdMlskhRvh5YxgkSm+EZ
         X2UgHVPtcVftTfI50orlOn5PFOvWl8FpGdj2TWcYBaNbRacs+5jtUBCpYC2QfRA6H3MZ
         M81Oqny0oEvih2brgIY6LN+8PX+fKW622WUr+1WqYmDQ6phC9spUvybCsnmP5G4jtBgk
         JGt2geoRh4UKUqDXu9KC/xTKN5sS8Wq5wqCbo1ebv5HqUgDDBHQE0a2KqHU03z21A8AI
         8Bgw==
X-Gm-Message-State: AOJu0YzBGdSHDZOv9th7PIq8PE4a7tPT/vfLPXxgtuC2tTC7X14k+2fU
	K7VyA1Rk+WZbK/muXHqrOh4=
X-Google-Smtp-Source: AGHT+IEJxQd9Oqcd4G67bDzrVNJX78gVSfE3k+NxBSuyqs7fZY5a8noxIH7dI7lmZgLO86KsDGskUA==
X-Received: by 2002:aca:220b:0:b0:3a7:4cf6:f0cb with SMTP id b11-20020aca220b000000b003a74cf6f0cbmr2540164oic.21.1691585247611;
        Wed, 09 Aug 2023 05:47:27 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.173.206.194])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a7ac800b0025023726fc4sm1362860pjl.26.2023.08.09.05.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 05:47:27 -0700 (PDT)
Date: Wed, 9 Aug 2023 18:17:22 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: vt6655: replace camel case by snake case
Message-ID: <ZNOK2u1sJoRAxhIC@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace array name of camel case by snake case. Issue found
by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 v1 -> v2: 1. array name renamed from byVT3253B0_RFMD to by_vt3253b0_rfmd
           2. typo in the subject line "small case" corrected with the
              proper word "snake case"

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/baseband.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 0e135af8316b..cc8793256661 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
 };
 
 #define CB_VT3253B0_INIT_FOR_RFMD 256
-static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
+static const unsigned char by_vt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
 	{0x00, 0x31},
 	{0x01, 0x00},
 	{0x02, 0x00},
@@ -2005,8 +2005,8 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		} else {
 			for (ii = 0; ii < CB_VT3253B0_INIT_FOR_RFMD; ii++)
 				result &= bb_write_embedded(priv,
-					byVT3253B0_RFMD[ii][0],
-					byVT3253B0_RFMD[ii][1]);
+					by_vt3253b0_rfmd[ii][0],
+					by_vt3253b0_rfmd[ii][1]);
 
 			for (ii = 0; ii < CB_VT3253B0_AGC_FOR_RFMD2959; ii++)
 				result &= bb_write_embedded(priv,
-- 
2.34.1

