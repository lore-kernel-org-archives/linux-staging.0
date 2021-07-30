Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D784F70
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:10:35 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id yk17so7892398ejb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SmSFntXo42F64KXJ5DYrzhICbIK4OEVcdEWb/uS+d1I=;
        b=sImjCvaVAqeQqkjOk0qRpgJ3XGblIkc2rrDmcnpXIY4UUeDmU1OBjj5oSqg1HW7ms0
         pYzaPsKdrkEdoMEr5jvo95pLaXsaJI1gJCyB9kIFrJMeMgARERC8V1yBfRe7TapZlxkp
         KCC05oPtC7/tmG8E9NmOvH5doGRRPKXvtrEPl/r21WQZozPjPS3eGmZz2+ySUfl291rb
         96acB2QBuUhRf1wSHFkWxBnk4t1tlMqavrH8rpTAPwhEXwraEjU74udbld/wkUe2EpVP
         6siMpljg41YHo8GEFNocAjLold7lLorcNBzBg8YGA00IAte8/5byNdeGUEjwylEG4Rho
         QKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SmSFntXo42F64KXJ5DYrzhICbIK4OEVcdEWb/uS+d1I=;
        b=qbLV02aQBySIGGOaLzB6UVNjprM9+upOz43IkArCDMZ+CK02MotP+W6U7R0fluA4Rl
         ONPWF/JEcp63KiaTpqrDQnJwP4C66w74fXDOEmFTXT/9/Z+5sFNxc0EIlWXCod9eng8V
         MqtgXUXYVDkxdDgc5cw/iMJyLZPKfC4TPgTxbwZz4ELBY/moecg9EWUSnuocN5R/vLuw
         ENm6tigdV0sDhk0ePwyUoPTW+Y/Zq+wnXAf3k9/NccXXwaTTIGGSPsfB5IKDTpn0LqN5
         Pg4MWI1pZnUItmqiyEGG3ngqaN9qeZDb7OuLey1OUfhWrLql0Wyr3lKbWXZLQy4BIuAK
         1Fdg==
X-Gm-Message-State: AOAM532O5oV1Onu+Mm8tj8qDVmZZc1YjGWf2jwjjDPI2wZX4kX8v0ZcF
	N8ZCpEYR9L/Zm6tbRW7phqw=
X-Google-Smtp-Source: ABdhPJy2+6evQAzc0EY/tQascXTV7xNSwY7FR6AWKrG8xXCOx+vqVjR36CWdGzTPaVRGFRTsF98inA==
X-Received: by 2002:a17:906:af02:: with SMTP id lx2mr1564041ejb.133.1627636234126;
        Fri, 30 Jul 2021 02:10:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4bf9])
        by smtp.gmail.com with ESMTPSA id da23sm417665edb.34.2021.07.30.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 02:10:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: rename odm_EVMdbToPercentage()
Date: Fri, 30 Jul 2021 11:09:46 +0200
Message-Id: <20210730090948.32759-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename odm_EVMdbToPercentage() to avoid camel case.
odm_EVMdbToPercentage() -> odm_evm_db_to_percentage()

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 4c9317833fbc..6afe3f9bc47c 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -77,7 +77,7 @@ static u8 odm_SQ_process_patch_RT_CID_819x_Lenovo(struct odm_dm_struct *dm_odm,
 	return 0;
 }
 
-static u8 odm_EVMdbToPercentage(s8 Value)
+static u8 odm_evm_db_to_percentage(s8 Value)
 {
 	/*  -33dB~0dB to 0%~99% */
 	s8 ret_val;
@@ -338,7 +338,7 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 				/*  Do not use shift operation like "rx_evmX >>= 1" because the compilor of free build environment */
 				/*  fill most significant bit to "zero" when doing shifting operation which may change a negative */
 				/*  value to positive one, then the dbm value (which is supposed to be negative)  is not correct anymore. */
-				EVM = odm_EVMdbToPercentage((pPhyStaRpt->stream_rxevm[i]));	/* dbm */
+				EVM = odm_evm_db_to_percentage((pPhyStaRpt->stream_rxevm[i]));	/* dbm */
 
 				if (pPktinfo->bPacketMatchBSSID) {
 					if (i == RF_PATH_A) /*  Fill value in RFD, Get the first spatial stream only */
-- 
2.32.0

