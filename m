Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE66271
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:30 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id o19so1165176edc.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HJqQJvrsu2AgEydH+oU+Yu3fjSul6JhGXyuC5jgh4hc=;
        b=MogSFjQB68ZvISvsXroExN4si7+tZ1EaEuqlXoEEh7UxWVM4GrUCaycBhWP3SaoVuj
         iD622bpJC2BGycQ3PpHomATvnNRKj3J/d0J7cRaSadqzkQcRQnfgXQyf3G07JxNvH3kn
         GZHTGidltB6edZnhbD2I0vT9KDetVJZVHJmHbg0jCX3juTCVBEBUfQznh+FiZEryeXhy
         la5m6mQa+CO0L7GI+MwF9rnkgWnVZW4grYTSAATRLF0KI5/kFAL1fJOg53ow0sTky7dS
         U2EAO8Bd4trHx8FpHcE9HRDfu4ByreGG0k2YHfAgkxrnJdWSfA8z99a4yVn5LdDHU3TK
         lhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HJqQJvrsu2AgEydH+oU+Yu3fjSul6JhGXyuC5jgh4hc=;
        b=U5OKCfJjFay8t9c7NLuzU1uxb32yflNiBd2GOsKfxGzL6GxGkoHqGiNLPfSUggr3mi
         XKeaFiYuRVpFszIfmICdgRXT0fcD2smZwoaPSwdS5SbBARwTKN/MzNxFH4GC57zfEdwf
         16nlDnqATBm2a6wp41DQGcejh3ygtSDMf6UjOPE8AiTCfuT6lkLP/y32Y6BXFcaW2bE3
         +eGDM7SSt+rXAhJVvQSo0scjRBAQ3UKNn8wnCHoVBQicrckX64jBfQ+ILylFfhUWb7Eb
         QS8bBzb9jaaCBWQQl3HdxsuDGdvKoE5rZh0Dpmio1e3FHgoBD7miuy9ymJU5IGrf8hor
         7UHw==
X-Gm-Message-State: AOAM532GXB15xeMAO/PMy0yXVhFMaMH0lu28vPjQxPIuCSwOY8vEVPiH
	lDLXo1INdQewkGOcjOR+Cr0=
X-Google-Smtp-Source: ABdhPJz7y4HkkFaSkXhoT8ePVtZrgs70neuhX4x01f2k+C9e4/Ynwue1N99H1zuhZ5YkVyaEjuvRjg==
X-Received: by 2002:a05:6402:5203:: with SMTP id s3mr8858612edd.79.1617268889571;
        Thu, 01 Apr 2021 02:21:29 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id z17sm2581223eju.27.2021.04.01.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 04/49] staging: rtl8723bs: remove empty if block in core/rtw_security.c
Date: Thu,  1 Apr 2021 11:20:34 +0200
Message-Id: <31c2087e7876143b5da76891b19ac0b3ef8ac731.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove an empty if block

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index c91a1eef40b3..acef6aa0b393 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -236,8 +236,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		/* calculate icv and compare the icv */
 		*((u32 *)crc) = le32_to_cpu(getcrc32(payload, length-4));
 
-		if (crc[3] != payload[length-1] || crc[2] != payload[length-2] || crc[1] != payload[length-3] || crc[0] != payload[length-4]) {
-		}
 	}
 }
 
-- 
2.20.1

