Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B211A2C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:47:43 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id z9so69826693edm.10
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/7tVUFA5BpbcszbRDi/MJAUYJgI4RLmmnTJgCcr9+0M=;
        b=heyFdRRYgg7YwVoWeFAfVJ5q1HLtYbbPR3kC2W690sFeL2+PTDmeBqVVoCHpH+Vs5A
         DP8MYQmx6swGjQp5VrVSZ4Bk1bQYxKOd65PqaJArhKWOKiTHhUoZzVG05KX4XTGloXef
         auibkdNMME6R8bZkA83dIK7L6CuruUEJN8alVad4PoSoP4MWfUTC0ZwsShRCxak/tDj7
         59xKVVd2a4uSY1IYOpBDa2wNRmdg1Gk1ttXPObD0bxi/nZAawDZzwhNPmzOggYtSruKq
         YvKAFx7O63CMG6thd4Ja41gi86sP+ubajlZkzCuoKuXa0D9cXLgfoDQ97SNivaT5p3yN
         zHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/7tVUFA5BpbcszbRDi/MJAUYJgI4RLmmnTJgCcr9+0M=;
        b=sIefFiL50kNWtMCViQ27aL3LNu0GQRoVWEDPraf6NBxidR7+MDE0hDJUw7LMrNoVlG
         PVG10GVktZLHFdiMk+wzd+3bAhGlOYAHELkUM/gA+8blXBjJDBNIUuMtRihmMKHERXH4
         5H6z6skMHO5H2DC5b3nc8hIdPq8XTfSh8aNzpqrV3zeLXoXl3K1xVuvAYA5nR+GGuvEV
         vDNVEKuF6VXfNbKw5t3lPqH4sJlRBOU3rNq5qZ+hATr4Q2aDpPChzsj2AcPw1M7rEP1w
         0X/F5DHjpYiR8Tbs8lnF+dk5ZHlaOqE4gLRjyVBTMBX/fPpFxo9THuAtF0sYtCrVD71F
         SgYQ==
X-Gm-Message-State: AOAM533RAZcCNdqOFOPj89HUduFsd3u2Y+QBObf9NiSg2ltB3BR8NRMG
	rilPJHbfip7RCXQZT3yPofY=
X-Google-Smtp-Source: ABdhPJx/R4XNYPl1hQTuzzTIphVncq5o9AATQcvUa9xDOlrYm81FtXo83qeLTVGar0j/NB/apUSvuQ==
X-Received: by 2002:a50:e608:: with SMTP id y8mr45111653edm.39.1641239262141;
        Mon, 03 Jan 2022 11:47:42 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:47:41 -0800 (PST)
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
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 45/56] staging: r8188eu: add parenthesis to macro set_eosp
Date: Mon,  3 Jan 2022 20:02:20 +0100
Message-Id: <20220103190326.363960-46-alb3rt0.m3rciai@gmail.com>
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

Enclose in parenthesis complex macro set_eosp

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 45774d7a6429..8364b16dfd36 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -239,7 +239,7 @@ enum WIFI_REG_DOMAIN {
 #define get_priority(pbuf)	((le16_to_cpu(*(__le16 *)(pbuf))) & 0xf)
 
 #define set_eosp(pbuf, eosp)	\
-		*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4)
+		(*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4))
 
 #define SetAckpolicy(pbuf, ack)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16((ack & 3) << 5)
-- 
2.25.1

