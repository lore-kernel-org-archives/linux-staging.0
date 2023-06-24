Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A177FC
	for <linux-staging@lists.linux.dev>; Sat, 24 Jun 2023 06:04:01 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51d889ab483so7579a12.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 23:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687586640; x=1690178640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pA2jkr79HAQgO3Z0go7Vrb5Aqnnlcr4ywSCkzPMV9Eo=;
        b=letFtaa02giljSKBhUJXMSlsE80/XLx8rhYD8T02crEkd3ClKKcgnQ7VTO1H3XV7FI
         vzdkL3uAp79g9np/8906vQSACE8gNhpUc3Vf7doCvP5dTUtxWyJKydQ91H17czf/Qoar
         b7AbzUWWecKwopabvEarp1Ojix80ioau8nPnmqvD9h4viuAYyZvjC6+TGsF4WbiMOkpp
         6n9l954XhpDxt9a24vkWoxH4hVfiIi+a+L968ie3S5L/TZou4jqAabyYLceLa1rpA9AB
         1D3/m9OVbvslFsMH9wNPcPGyHXk90Aj05DucbgM5q12NEvmSNUKXyiGsJ8FzsNNlHTJZ
         M4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687586640; x=1690178640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pA2jkr79HAQgO3Z0go7Vrb5Aqnnlcr4ywSCkzPMV9Eo=;
        b=OBK7/3D3XDDkJuCEjQ8hVKeds43S3JqN9s1bUcXg01kTWKpfAlJY4WfL3Y4hJsxMdI
         trezga2hLogn9crm/0mBjzZ0XC3uBEIRKgITrwoNgBqxQWC74JogrTVTRsxOvSaappBy
         NPqbgDRYduwV/f8IF447uwUyK7V6kxXygauPd0xTZdFZgEImdR6fUqsNMB49OBmyLc6v
         Riy4dJlEhqD2Hkk4zuupxtSMUE7ybeyOri7fK3Uybeurbip0qX0cK+3VREZYn62weRA4
         LqpBgtY3ia6weQGZm8j4q0qtMU2E6enS3oT/AoRrfxO+kGs7YFxCSvWo3B82//KtZHl/
         VudA==
X-Gm-Message-State: AC+VfDyEtblCLAlkh1L5rcJ+orimsdsFxYh1LhlsCp9x1TB/0gu9T2X3
	Lwj9eVhzp9Q23ld4WiHnOoQ=
X-Google-Smtp-Source: ACHHUZ4bHhttEzXSc2wdcua+iq74NCIJmLE8qVn9FEHU0Rt6VBg0JjUIL52nTOHw7T9sF84wGOdZLA==
X-Received: by 2002:a05:6402:5112:b0:514:a59d:93c5 with SMTP id m18-20020a056402511200b00514a59d93c5mr17018620edd.2.1687586639895;
        Fri, 23 Jun 2023 23:03:59 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id u22-20020aa7d996000000b0051a26ce312dsm309144eds.71.2023.06.23.23.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 23:03:56 -0700 (PDT)
Date: Sat, 24 Jun 2023 08:03:54 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] staging: rtl8192e: Remove empty function AdmitTS
Message-ID: <572feb55932b59c7fc652183877698f8b1123d8d.1687583718.git.philipp.g.hortmann@gmail.com>
References: <cover.1687583718.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687583718.git.philipp.g.hortmann@gmail.com>

Remove call of function and empty function AdmitTS.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 7fff20b185f0..474171edb2f9 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -173,11 +173,6 @@ void TSInitialize(struct rtllib_device *ieee)
 	}
 }
 
-static void AdmitTS(struct rtllib_device *ieee,
-		    struct ts_common_info *pTsCommonInfo, u32 InactTime)
-{
-}
-
 static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 						  u8 *Addr, u8 TID,
 						  enum tr_select TxRxSelect)
@@ -352,7 +347,6 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		pTSInfo->field.ucSchedule = 0;
 
 		MakeTSEntry(*ppTS, Addr, &TSpec, NULL, 0, 0);
-		AdmitTS(ieee, *ppTS, 0);
 		list_add_tail(&((*ppTS)->List), pAddmitList);
 
 		return true;
-- 
2.41.0

