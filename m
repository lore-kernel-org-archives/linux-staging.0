Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110BE6136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:35 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id mr24-20020a17090b239800b001bf0a375440so485150pjb.4
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ezGZS6wKoaDPZZr1vSGSOGCOOXHs/t5LaRnTO/HK9rM=;
        b=LawSeR1NmUPUaUioLDLVRqBuUyq3N4d67ynn20lLI3i3DZ3CODegap5Yx7zLInYZ/r
         O8E5M8tCP1pGZ9VUwlv+xv98o9JL8OsaV30TLtKckOZNrYzkWxO3OjkYw+5ETMEVG4ib
         K2IGe5HzdbqZcgrhpAfHFCC6HvDVOmji0/t9EzKBXtMtqTsQbbvlLgoOnwpSWSRR2v8h
         GJuxjshLyHG92UAdodKsXzogzMlZC4wnVaurId9t2/7NhZWFFWjuk6S5lMwZuWCIOHrV
         JLIUQYW/5Qo9fDK5jBeWmreyJmekoOFaYbF9ZEGgMk/veivOmr2veDI4EdWhjvNy3/S6
         ngtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ezGZS6wKoaDPZZr1vSGSOGCOOXHs/t5LaRnTO/HK9rM=;
        b=kv52NPZcLG25DJKosQRSu98xzOUNgqk4oyCdpgV/7lAGpMmhSMruKht1PsK+YW+lyB
         neC94/TzmoBoeKvu+sBE0MB1VDacehweWHT45X78L7U1/XQVil+nKsd6nMSQcZmled69
         QH25Tc6Ux1PbfZsQ3W2xiNNfMZXGdqwJ1+cgXjGX3erxXJiFIAE9ZT9cHyDAmVUgc3cI
         JY8XFhhhQtm7Q/KmHi3+E2jVceqqCT+CBAUrhyyJ+ccPlK9Rcp9FRtoil8tVU7KpMqvg
         A1G0Dqzc+bd4BN+AhhVp77np2ankJa/7qZZGoAbUKrgcs63vhYFQEeoykYASvfiwIXVw
         bgMA==
X-Gm-Message-State: AOAM531X9mY2XjykDr3m9E0Q6bVIBQr7R5rU2syw6WArslVfk9G2NKuM
	wjoskHvwv3BJbFO/E7aDW1ahCzrGX8IhOA==
X-Google-Smtp-Source: ABdhPJzQJ3VVGTz9pnkt/XW/nXhMX9DaRNvZpdSD6AbdCZsfrAJkHTTFWDXhW9jS3HYgUMIXa+uCzw==
X-Received: by 2002:a17:902:6bc5:b0:14f:ae30:3b6f with SMTP id m5-20020a1709026bc500b0014fae303b6fmr33142297plt.60.1646254114629;
        Wed, 02 Mar 2022 12:48:34 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:34 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 10/16] staging: r8188eu: mark is_basicrate as bool
Date: Thu,  3 Mar 2022 02:17:31 +0530
Message-Id: <20220302204737.49056-11-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark is_basicrate as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index eef8523c3..8e8a82a1e 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -167,7 +167,7 @@ static unsigned char ratetbl_val_2wifirate(unsigned char rate)
 	return val;
 }
 
-static int is_basicrate(struct adapter *padapter, unsigned char rate)
+static bool is_basicrate(struct adapter *padapter, unsigned char rate)
 {
 	int i;
 	unsigned char val;
-- 
2.30.2

