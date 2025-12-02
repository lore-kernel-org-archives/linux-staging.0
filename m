Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13748312801
	for <linux-staging@lists.linux.dev>; Tue,  2 Dec 2025 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764676983; cv=none; b=WfFQo7WlVrDBEpro0SRromiOBn76f+Ccb30WLoUInXFQT2DPArpZj3IAp9WCAONLiYULs2AQcSL78WHTjw6ctfgCpGUPYWHPG26BjO1THG9Zosx69+cY/w3aWEbudry2O52cnl0aZKVAO4a7K5eB2kILCwUelrLP7uCaNCtoMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764676983; c=relaxed/simple;
	bh=fJWPwY723ULgtVgkQjZtPrkYZvNU8HxVmANectBbrDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XMh86V9yOF102aDSdTK1jnK6tAh+pvUlwkvQzawtkKVnUj99xqZ9VoktogjoJwZZFBEZ1pLRiZIXIbkiTWhEiKcOlvc/hn9UoLTtFh8TIM88DZgbtkCo17ly7fYDxqMwdK6oIYLLeqHkXG6z2/On0IOHoj4t1PAmW8VP/Fi6arM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvLBCxDj; arc=none smtp.client-ip=209.85.208.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvLBCxDj"
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-37bb8bef4cdso47378991fa.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Dec 2025 04:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764676980; x=1765281780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jG08/J7Wqu0U4ZYwI7Hu/RQAPwp2mHobhNdvN9y9utM=;
        b=DvLBCxDjwM/0rXzVBlCHl/slFk5r94VGNKMYzVTfVZ1dCCfbXzvVCDQ1hjUc5Pvc64
         AkiDoxxEVWPhCYM4OBSIY0NK5pJqyxPbK3nli6AyJt+Vg+6+kJWv1ZzliYSTn8mDM3wH
         EZcHQAp8QTXDQPcCipe6i0sulkCkIQRRFBTP1B0Qa796QAC+5hGsbA+6BEQLDXSNh0Qu
         ei5PPBjo17NZLkqfEEpW08bf8gY7Fwg2iRIVsCLfZ85B3zERVXIWQRxoomGYiOKla4Af
         tl8S9j2gLbrzVtSVtCnK8gztTuC1/jqgNXWE04Jf6YaG4bnuMU7G8ScfvWH6kg0XKczK
         zRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764676980; x=1765281780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG08/J7Wqu0U4ZYwI7Hu/RQAPwp2mHobhNdvN9y9utM=;
        b=MT9L3t5SKdshKk2HVNC+iLJ+/a5lcgr3EJjc0uZJXx9ByWW32080Un0rCa8MD/2pwr
         oN1BPMuRN3dFoosLRPkf2LXvPg3OTJ0b8ozhWHHmsFSEUH+RhGnSAwseYJu9vTmkVqe5
         dGx1K6aD1ZHZHd6j0eF7h5MbadYwba3eWmRWt8nhIMNzg47zwZ6aFMW9FnQnINA/4opF
         gAjggcQygd7hO3Im1lnJgVlrqVk0edhuQrwWlYGvw25tebsigXl4sgM0rhZ1eP9WUSc9
         K9b4RgYcROnhNfTD6VqUKTBzNM3yVLi3zIFsq1oo5XN8qQK/9NZ6mNumwzzQzYwpNvIZ
         FNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVks+OBAYDPBxm/PR/lB80L4NLVNN1WjtNQ+X1W3AfY+8zD3o50etAG2+w2Xx2wXXGqvTTfFDhGBQXZuX3C@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+z0o3/By8XDm0ARS8lO2Ep4HwM3cDtx4bDGgQRB8c2jmpXyUf
	fbuJf6O/0sB7vf0ZXkVa9sKxZQPaqeI5JGJQ9mJ5v630kLhzq+X16ydh
X-Gm-Gg: ASbGncsU4d5asga554QhLAUkYig3nUBzufi9HOVgprDt9X1BRjX3p/kNVAL6K0BDUHA
	HWTZkFPJdZzypYt3myR6pHnGrczDizlgoPb2YbJBON9PhPHr4P1NjTeHVMjQGa79sb1ojwGbozY
	UUv7HkY5M4W7qfUTcaIdcMRXAhmmvFVZ2OhkPC76e/TCF2+PgL6WM0/ETmAnEjKw66RamgfED2O
	Vk+jw37iRcSkur+KcShoV2760+IfMUBTsI621Gs4pnmz+qQ7VU0jwPAegLTgGc3RacVvaqAuPtM
	fNGgMg9AtRyGq/D7JVDQ8EmC+QQlvzM53kYJzy81UcsHtdTCs4pxF9hXyULEAvI2D5kz2bqJWgA
	yunqQ5QitQ2nuBrWknzYsIqdc6/uYrDa7lepiBzuA1oQ7BUfrKfJ7cSz25aGEH9K0vjD14RwkBD
	NyYDhNp2kRzS/hWMANTSufNKQccn2fyyLTkvRX6USSEM0KaouKCyRH6cRKmg==
X-Google-Smtp-Source: AGHT+IGGPdkU3+EE7NrwXBfeL0c30Jy8lQQXAxk/MVHA5a3hbDVEH93tWcMS5Zm9tbkt8OF1LdZtOA==
X-Received: by 2002:a05:651c:43d8:10b0:37a:4611:9fe5 with SMTP id 38308e7fff4ca-37d077cc7abmr72780701fa.18.1764676979653;
        Tue, 02 Dec 2025 04:02:59 -0800 (PST)
Received: from rbta-msk-lt-302690.astralinux.ru.astracloud.ru ([89.107.11.60])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d236dd67bsm37720721fa.14.2025.12.02.04.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:02:58 -0800 (PST)
From: Alexandra Diupina <dyupina99999@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Alexandra Diupina <dyupina99999@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH] media: atomisp: avoid memory leak in ia_css_pipe_create_cas_scaler_desc_single_output()
Date: Tue,  2 Dec 2025 15:02:40 +0300
Message-Id: <20251202120240.14670-1-dyupina99999@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ia_css_pipe_create_cas_scaler_desc_single_output() may fail,
so add cleanup by ia_css_pipe_destroy_cas_scaler_desc()
rather than simply exiting the function.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Alexandra Diupina <dyupina99999@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..4b553209af56 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4528,7 +4528,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			  NULL,
 			  &cas_scaler_descr);
 		if (err)
-			return err;
+			goto ERR;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
 						  sizeof(struct ia_css_binary),
@@ -4561,7 +4561,10 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 				return err;
 			}
 		}
+ERR:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err)
+			return err;
 	}
 
 	{
@@ -5107,7 +5110,7 @@ static int load_primary_binaries(
 			  &cas_scaler_descr);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto ERR;
 		}
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kcalloc(cas_scaler_descr.num_stage,
@@ -5141,7 +5144,10 @@ static int load_primary_binaries(
 				return err;
 			}
 		}
+ERR:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err)
+			return err;
 
 	} else {
 		capt_pp_out_info = pipe->output_info[0];
-- 
2.30.2

