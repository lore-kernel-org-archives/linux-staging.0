Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212C2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:56 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id n2so105630188ejy.7
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jMN4zuhUHvB3cXnh9Uh5ILIZdfR0r9cSa/aL/onWxjs=;
        b=ImsevUptTIw5yMnp6rOZ2eKLvSNGzcXZLOo2G2SCEUVKFA57o+Zqc3eL7c5ByaQ1O6
         D326BbqxxAPO/j6MGxBWYuDkUgSjT3oSZ/k0til0L9qqiQgWS9PGFq4LloZVdukj4j4Q
         qBEQDB3zVI2XpedN20CHlvk94K2vfvmU/7jaEqvSptu/G/LH+LSlxScy/ds1sjBfhGPE
         qa8aGwUOuEIzR9UC3gPVthPBpyp5zTu5muzlSmVp+jh4aDvHi48xgUBmWEjvKbl9Z3u9
         kMHohTK67PTfrg0WQf6Lv4Z1nysPnD5FXXZE1q7rTTJNXx+ruUgqJLKj45NDPA9tYBC4
         +ugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jMN4zuhUHvB3cXnh9Uh5ILIZdfR0r9cSa/aL/onWxjs=;
        b=jtv+C69RcKaC8Gb0jIi0BIrqcrw/p17oxSjbkOVYHyqsEikhMxeEwGB1tctcl68cDN
         zqGRCloRHyALo5C0sR1nFC+iHQtFLEqCUaB9HATm4KPi+WJ+TXMalrqKxulpziDwiqy+
         GC8dnMMV2KNTS/EOsS+SGz3egOBg4cXxugxQTMY1mwy2iTsQ3Kmr37Lezxwq/8iq9uQA
         Jh5H5qrmjEyKG1LugN7/kmaU4P+qTxCRj5EhlN/zgAJpGqmT8d2ZqyZ3rsy/aTr0BpDp
         0/U/ThUpnnoLXUV16xV+kPjSYzysbVmbPG0tdg2/o+mvacWfnw2EOsPyqINZgPT9rFhY
         RgMA==
X-Gm-Message-State: AOAM530Fu7UnaLv/rrO+DqsjXpoVsOGNFJqucKvZjTT1Hq5PPmRwLhmj
	JEGyH1DnWB1BAEDp0IKq6Eg=
X-Google-Smtp-Source: ABdhPJwUkNGvWqgQ2WWhVBpdIy7+7iBux5Du2fauAeZwClblfs3D1oImyOFLYWvjHogPgIubArzhJg==
X-Received: by 2002:a17:906:32d8:: with SMTP id k24mr4944539ejk.156.1619793895117;
        Fri, 30 Apr 2021 07:44:55 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id ne17sm1953047ejc.56.2021.04.30.07.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:54 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 27/43] staging: rtl8723bs: remove BTC_PRINT_F macro definition
Date: Fri, 30 Apr 2021 16:43:57 +0200
Message-Id: <905bdc72245ff8354fe2f4abb995c31f4fc4fd82.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused BTC_PRINT_F macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 36636ad62aac..9c9ad29870e2 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -115,7 +115,6 @@ extern u32 		GLBtcDbgType[];
 /*  The following is for dbgview print */
 #if DBG
 #else
-#define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 no_printk printstr
 #endif
 
 struct btc_board_info {
-- 
2.20.1

