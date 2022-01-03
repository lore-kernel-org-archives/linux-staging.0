Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A852C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:08:45 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id w16so139508988edc.11
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2saZdtsDQ+rJsaXPQDxkl7huOB4aOMJMDco+QMBneA=;
        b=YDAvLJikdJ+gHcfk3XdNZ5E3rAVWIqAWMJlJsHkd7Au4Owjtjo0Du0lazZnsZXwz9c
         2TnPnZnxjR0e4xNBDPqOuElJg/RAGtDpx0x5W0Ta24yCD08tR5+jaPFiDAYilQKdyMFM
         OFwisKgfwLbFLwBeYtGXdNB8xkoc8tIpp6P35S3ygISD84dy/+hZz/gq3V80lnDvzvW0
         sYu+dHci8yyOkPEVt0IUX9QN5D77g1rKA1lfdDJ2Ss58+kg0hVv9v2vvsYDpyq2NPksh
         l7iDymy4Mm9bhw/DaUAqpQxv+auPl4Iyh3Epa0vBcmnma/i+kiI0JXlvP56tATEi3xJM
         IPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2saZdtsDQ+rJsaXPQDxkl7huOB4aOMJMDco+QMBneA=;
        b=QSD9KA8ndGC6xrQ0WqL7KMxpVj23MepHdIKzg7TnxI8RAAZf8ybYvUE0gkzColu3yp
         wCUwajRKyRfSpSipPyandLic+0oy8DoiI/od4nTTkb4Xq0YDbXM+s8mIke4TM6/Rf9h/
         QTYlunkKOjg1QOVwsIedbZ2xZW/hR6OIhPiORjb9qd/nzcUaUqp57tYeMbslVJIRVg13
         6s+TUKZkn/7rH5ipu0Bg11ZXLfUOAPZUCplyXhC3qq0mevm8xUH7yBawnn1LRsvJvLLA
         yRnx+pKm0K7iT5jt+RTGvdk2Cr4Cz8wFKewhMnj4d5SKsvZPC+eFJlzQhsysgm2he7tV
         8J1g==
X-Gm-Message-State: AOAM533H0yVudb5BXpAJXthe7Wyvth1rmTDFaRWOFJtzLL9kralsm0Rj
	0V3YuETSNyKtFEUNFiRpgH0=
X-Google-Smtp-Source: ABdhPJzg+2i7o0qKMomu0HVSa+TguGR55F9HFCxxexEE4BKfpRI+0yEhWBjpgIjdWVCmXLvTd3O9HA==
X-Received: by 2002:a05:6402:5216:: with SMTP id s22mr41592533edd.394.1641236924110;
        Mon, 03 Jan 2022 11:08:44 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:08:43 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/56] staging: r8188eu: add parenthesis to macro SetFrDs
Date: Mon,  3 Jan 2022 20:01:39 +0100
Message-Id: <20220103190326.363960-5-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enclose in parenthesis complex macro SetFrDs

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 487a4b7eafd6..07195a11aa78 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -169,7 +169,7 @@ enum WIFI_REG_DOMAIN {
 #define GetToDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_TO_DS_)) != 0)
 
 #define SetFrDs(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_))
 
 #define GetFrDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
 
-- 
2.25.1

