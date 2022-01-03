Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A778173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:50:32 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id n30so27665676eda.13
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EBCtfraAmRgogN+TWk2b+fgrpyt6FHhijN3lm5IyMGo=;
        b=JzwE8OC+fCMIVb3rBIi/xQH4TYFNbUi8v0d5H78d7WUSWqRTtbrdU22axLUwCTVngR
         wMmjtxQyRYDHHMf/iLecPAjUm/O2L8wQznXROEYsC2dPSGLP8TvHqBhAJf4d1w01GFyM
         nclmr4Mb4B1GFDWTasgqPNbf8UO35b9NlW9IStmOinMIipN5BgJ+/wn2NxH5R7wtluFX
         tKEuEGwppVgVgZABG9XBjq9YJA1ygWDMZFupnIWxaUJKFKJEhScmJ7gZTZSsQFtVrr0/
         Bcj/Jc6djvExOAg50xTEujsALlX3jS5pOfiL5Emu+L5dfN4BEsGLi1dL3/5yWA5QL7uU
         52AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EBCtfraAmRgogN+TWk2b+fgrpyt6FHhijN3lm5IyMGo=;
        b=6LtuPijD+x/XOpga76x2ZvmJ93CTbBWkNbn+9rCSmWy8iRI3m9QDYgOWnkatXynEL8
         BrgwyrfIWuovtGb3gKXKJxayU23QTzsDuxJ5RLbTXjaz5yTPUbIIn3uVY0mgdjRNcz2G
         s5HdcJHt2jZYp5Pdh074uHmoo9p4Rbf7RK9VWhSlQ8dCQabg59EbLoxjHMXUbOa+54X3
         U9GM4RmY6KTctlwongODuogZF8U88N1JJScm20YnQrvC+DcHuu2AXtR0el26O+OCqYJB
         /vo7bM0XoBFlzfY7RTBHnF5JdgDrqy66evN8mNk3Z/Xo+GBb37pjWhNgQyDCMqGMD/07
         4tdQ==
X-Gm-Message-State: AOAM533YZ52DCug+mb3V7vb/k8EJXHFA0vTDgBrSt8zIcHfKHE0nD9sO
	loRxLAIYp94VazM+Pu1i0Mo=
X-Google-Smtp-Source: ABdhPJxXdT44TSAg1vs0//faejxwIDsltTZMMfc0YXca1vWx4ZXdQGUkDuvnESkhyU7BNbNDLLpzfQ==
X-Received: by 2002:aa7:cb09:: with SMTP id s9mr6730576edt.379.1641239430745;
        Mon, 03 Jan 2022 11:50:30 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:50:30 -0800 (PST)
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
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 48/56] staging: r8188eu: add parenthesis to macro set_ack_policy
Date: Mon,  3 Jan 2022 20:02:23 +0100
Message-Id: <20220103190326.363960-49-alb3rt0.m3rciai@gmail.com>
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

Enclose in parenthesis complex macro set_ack_policy

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 75b54ab0fe9c..584161c9b5c5 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -242,7 +242,7 @@ enum WIFI_REG_DOMAIN {
 		(*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4))
 
 #define set_ack_policy(pbuf, ack)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16((ack & 3) << 5)
+	(*(__le16 *)(pbuf) |= cpu_to_le16((ack & 3) << 5))
 
 #define GetAckpolicy(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 5) & 0x3)
 
-- 
2.25.1

