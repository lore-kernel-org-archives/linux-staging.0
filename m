Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98FA33F0
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 18:58:06 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z12so10920193edl.2
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 11:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BsWsL39ltA1wTpv8W1hqbPPmQmDEyFgKV3mcaWzu08c=;
        b=deKENVLfFRR1fSZcs4ZiGvcW7ukzwIj8EfVX9z37LnXJPhxKNy3FxGIe6CQWbppQIZ
         aUtXjcAGORu3rS41d0DFthdls3+R9BXfOayU3ZVY6alx9It4b/1sA/9Q8sW/dkT/rJ2G
         9Ao5L5yysnSmKppJdLi3k8ZhAwWiJpjpgdWOPVfMgdGFaSfqQopk/Y1WJTZxPxt2ZDP8
         MaY0YsabmrGjtB+Q8UuEbY+n+gncLmW/+aa4camFgK4cnumJYM+U9/uWC6sRAa64MIhh
         Ls8lSPJ+3GTpzD1LHjG9g3DZMpo2nd7Y4COzsHpA4iu3dV0ji96ME61a5RJRK5Ze1E0Q
         q6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BsWsL39ltA1wTpv8W1hqbPPmQmDEyFgKV3mcaWzu08c=;
        b=TxmvKDo13JSQUeNUCKmQq5SjZZoqoymhkBhWYGKKI2WYHLuFV6Iq+f8k9x/sKBmGVt
         /aZylQaNmbjsnifqldOBuw2/ZcfYwkbzXzzfIWf6fP9KN7XeQ+JFxNgvyfuqKzYQXPDm
         cH5NCaCxjqFfksx0DurCl743ApVl6Vnzqyo1TyVsKnbMoVY/YnB3tM2Ru3G1MY86+h57
         LvL8488JjIDzMCWBFp8cwpfbLgrJviC/cRwg5LOn2+LPd0zkzLqUkxl3i9PexLkgELsh
         wAyAjE/yx/v/b+fe/6jXII2xYPpKH0eikP4wVC9DGyb8OOrYscTcE3g0mZkfhmIgwpYx
         rQNQ==
X-Gm-Message-State: AOAM531cYmQp9LY9XJjI2TXCnXCBd6/U0u1c8ewDuQmDNXfyI1G+jBCV
	aXOGqU5rrhhDtzhgyS/xy8E=
X-Google-Smtp-Source: ABdhPJxvfzcTLZbNQM0pkZ2JE75eq79nLgBBh5wlxm3gTixrxFK/X6sdt7LCtKYa6G2Wc4lkwKqYGA==
X-Received: by 2002:aa7:d494:0:b0:41d:704f:7718 with SMTP id b20-20020aa7d494000000b0041d704f7718mr17595132edr.147.1649789885302;
        Tue, 12 Apr 2022 11:58:05 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906771600b006cf8a37ebf5sm13443482ejm.103.2022.04.12.11.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 11:58:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/6] staging: r8188eu: remove unneeded initializations
Date: Tue, 12 Apr 2022 20:57:53 +0200
Message-Id: <20220412185754.8695-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412185754.8695-1-straube.linux@gmail.com>
References: <20220412185754.8695-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variables i and offset in block_write() are set in the code
before they are used. Remove the unneeded initializations.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index b4ab050a6f23..1e930799a0b3 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -75,7 +75,7 @@ static int block_write(struct adapter *padapter, u8 *buffer, u32 size)
 {
 	int ret = _SUCCESS;
 	u32 blocks, block_size, remain;
-	u32	i = 0, offset = 0;
+	u32 i, offset;
 
 	block_size = MAX_REG_BLOCK_SIZE;
 
-- 
2.35.1

