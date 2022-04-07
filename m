Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC392564
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 19:28:27 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bq8so12916929ejb.10
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 12:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wnTbVdy3uat7re2/juPonFklxWNyK89ebuwaKNLBbWU=;
        b=bHEgGFlejC0vA5GIGYJCTRgW+62fOE07VV1oIh0ULpSxNPVDs7Crq8tng1eP3bPCrr
         MZejo/w74kPfI5tmypAEQNOw/08WlUNbWKariIeozihTmnO+8rB7XbLD5EnbQFtf5yHR
         KXFO/D3lm1DqtgxbypU98uHO6/Kjsv/kbn1NRyRA7ffAwvxXwCN1zMqk8/YQGCH2P85b
         b+05e+MzDSmtp6Sz2ENZyioygmJT+pOFIbDY0FpVQ2PUWHoGjDqx6MUBo1v4BE9HRNB6
         bsqphuASgGWefs25oLSr2NM0LQuHnV/gvAMzfTEp8y6defaTuhCNtSL1wr62j0JPgqGa
         7eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wnTbVdy3uat7re2/juPonFklxWNyK89ebuwaKNLBbWU=;
        b=iO8M3dfpELM2Ik1oJ/Dn/6uPK4+cbZuhuzry761Br2Y8eFalJTL9tofCF4296Ymh8w
         k8cKI2gucx3470mbLY2IcwcUMwBu6DipOdN1ZzSQ2Hxhu+XXLBfoQwJKMVIIlOXyN04H
         ICpxzGXwbPsz9xPmnTQ16ARpGcujcUaLUUIGAarDuZBec5IR67+L16ADYxQBPiPdS9/M
         D6nd6azW9SpFxq/0AIcAxcuUpHlijD/JOzy9ZGZymw1e+AINH1hF+LXBtkqdjpF4ejY/
         Gb5hpZtNXUTf5nrbKMJpKn80Ph/NiXKzgjeBWR9AxD/GonCMptsFIH+jOZ9UREPb2m0S
         rr8g==
X-Gm-Message-State: AOAM532H49tN0t8AeJBvLJCITdTQtP9XVOddrL+Z/zyq/s4l9AGm9IzU
	3bNUmpRAFLk1n54/bDwMkDLk12Gf8RU=
X-Google-Smtp-Source: ABdhPJw46DX5p9tNemvjd8lEzMNSiQDkXYThLCxegQUrEqGXGes/Jno7y/w1kC/1LeRIyYPy5J//UA==
X-Received: by 2002:a17:907:7252:b0:6df:75cc:615e with SMTP id ds18-20020a170907725200b006df75cc615emr15235818ejc.683.1649359706161;
        Thu, 07 Apr 2022 12:28:26 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id k14-20020a50e18e000000b0041b6f23f7f6sm9652798edl.22.2022.04.07.12.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:28:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/8] staging: r8188eu: remove unused fields from struct eeprom_priv
Date: Thu,  7 Apr 2022 21:28:15 +0200
Message-Id: <20220407192819.10661-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407192819.10661-1-straube.linux@gmail.com>
References: <20220407192819.10661-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused fields from struct eeprom_priv.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_eeprom.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_eeprom.h b/drivers/staging/r8188eu/include/rtw_eeprom.h
index 3e8d3bb48903..d8d48ace356c 100644
--- a/drivers/staging/r8188eu/include/rtw_eeprom.h
+++ b/drivers/staging/r8188eu/include/rtw_eeprom.h
@@ -11,10 +11,7 @@
 
 struct eeprom_priv {
 	u8		bautoload_fail_flag;
-	u8		bloadfile_fail_flag;
-	u8		bloadmac_fail_flag;
 	u8		mac_addr[ETH_ALEN] __aligned(2); /* PermanentAddress */
-	u16		channel_plan;
 	u8		EepromOrEfuse;
 	u8		efuse_eeprom_data[HWSET_MAX_SIZE_512] __aligned(4);
 };
-- 
2.35.1

