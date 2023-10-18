Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F55017C4;
	Wed, 18 Oct 2023 01:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNUl7w1B"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-538e8eca9c1so10785374a12.3;
        Tue, 17 Oct 2023 18:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697590989; x=1698195789; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kiAH34C/kctaaX3077HYkei7HPlkFJr20QXBxwSI6Qc=;
        b=RNUl7w1BlzFg0olILlqTQWVve25eEo8DvhnGfvQMAEpava2Ds5bTln/nDMwo2YgD6b
         JzqU3xPmJa/OwT7OodjGxqqBzng4Y61bKKo5QOFuFJ6JG9Pz/2wdkag55998bjZZwOAO
         foe/hfQohWtU5qnoTnrHtvmjr27gOiqTAUvVVnx5ErRSE+u+Y+QCP7bx/VlOjY8G3YCK
         kKjWp34T74lBiPYZUSOxInjYxviUiCvPKKboCQJQWznZ4Wiix44NLV+kOoAYGyZ+0wtr
         aE653ZPY1W8zmU1rOEZaWv0AGSw6TeeC/fs8A1GoquHpnBKhfNdhwrWiYKi50uFIxAB9
         KBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697590989; x=1698195789;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kiAH34C/kctaaX3077HYkei7HPlkFJr20QXBxwSI6Qc=;
        b=l6aMPX4sgUgJI6Rh7S0yGDBNPLBrmh8F+EyaRgdn4rBDMu4s6XzkEWnfcmClRXWOpv
         glNl7i+k6MCyRM6C+sxLDmkxmDdxGq5JDH6tm2+kUmyP+IB2U+EOot1Nd8vM/AiUEPJT
         6qvaQrtxX0EEdEpqJcoTXTBAV4OdRGT2ATEnDT5aEGCRfeOE8TmVdSEpmEkabFLR4Kca
         qaHND9LrnXV1wEaq8dAe5dEUvEUR9/TsZSDcgozgWusjfxH7FkrA5rGiPat5Djblrlsr
         PQaBc/QmG5FLTH05VXIs5JACFXPvPmRJFJNC27VxsJD3MXYCo449Eb80+FiedfJP1+2r
         zQSQ==
X-Gm-Message-State: AOJu0YxPIav1+IRaecD7dGWQm3c5ViKjtn8am16RViNzPzFdE8iVUFmW
	Y9fuqI8Vaqx9f4sEM/CUG3M=
X-Google-Smtp-Source: AGHT+IEOToHY+FjeZ1+QFC3prDpL+/1h01J16kJ+hEmruNGEAZNL8D/NLPUO3ox3BEM032g/UpDm5Q==
X-Received: by 2002:a17:907:36c3:b0:9bd:9507:ed1c with SMTP id bj3-20020a17090736c300b009bd9507ed1cmr3154408ejc.18.1697590989156;
        Tue, 17 Oct 2023 18:03:09 -0700 (PDT)
Received: from ubuntu ([129.205.113.163])
        by smtp.gmail.com with ESMTPSA id n17-20020a17090673d100b009930c80b87csm616449ejl.142.2023.10.17.18.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 18:03:08 -0700 (PDT)
Date: Tue, 17 Oct 2023 18:03:05 -0700
From: kenechukwu maduechesi <maduechesik@gmail.com>
To: outreachy@lists.linux.dev, shreeya.patel23498@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rts5208: Replace delay function.
Message-ID: <20231018004300.GA3189@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace udelay() with usleep_range() for more precise delay handling.

Reported by checkpatch:

CHECK: usleep_range is preferred over udelay

Signed-off-by: kenechukwu maduechesi <maduechesik@gmail.com>
---
 drivers/staging/rts5208/sd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index 74c4f476b3a4..059f99b0a727 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -865,7 +865,7 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
 						     PHASE_CHANGE);
 			if (retval)
 				return retval;
-			udelay(50);
+			usleep_range(50);
 			retval = rtsx_write_register(chip, SD_VP_CTL, 0xFF,
 						     PHASE_CHANGE |
 						     PHASE_NOT_RESET |
@@ -877,14 +877,14 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
 						     CHANGE_CLK, CHANGE_CLK);
 			if (retval)
 				return retval;
-			udelay(50);
+			usleep_range(50);
 			retval = rtsx_write_register(chip, SD_VP_CTL, 0xFF,
 						     PHASE_NOT_RESET |
 						     sample_point);
 			if (retval)
 				return retval;
 		}
-		udelay(100);
+		usleep_range(100);
 
 		rtsx_init_cmd(chip);
 		rtsx_add_cmd(chip, WRITE_REG_CMD, SD_DCMPS_CTL, DCMPS_CHANGE,
@@ -918,7 +918,7 @@ static int sd_change_phase(struct rtsx_chip *chip, u8 sample_point, u8 tune_dir)
 				return retval;
 		}
 
-		udelay(50);
+		usleep_range(50);
 	}
 
 	retval = rtsx_write_register(chip, SD_CFG1, SD_ASYNC_FIFO_NOT_RST, 0);
@@ -1416,7 +1416,7 @@ static int sd_wait_data_idle(struct rtsx_chip *chip)
 			retval = STATUS_SUCCESS;
 			break;
 		}
-		udelay(100);
+		usleep_range(100);
 	}
 	dev_dbg(rtsx_dev(chip), "SD_DATA_STATE: 0x%02x\n", val);
 
-- 
2.25.1

