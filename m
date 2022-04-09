Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF587A52
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 20:59:04 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 21so619493edv.1
        for <linux-staging@lists.linux.dev>; Sat, 09 Apr 2022 13:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d12oPKQYmPRZxibcnnbYIKPV48P5kQ/K2Jm+dOK55is=;
        b=oGtt24kqoDhxdGwzLtSU0GmNtjcoi8NQoXUP+igb0fdMeK1XzigLaGtVNr0lPKkFMv
         pLo60ifxJgH6DCCYKZis8DIkvNC+7nq5jGHi/yXIZnhdlG8LK/AQ6TlM0PYojoEiwr60
         A//RI5ytvUIeNOI6DOdeY5PSM5sxe6KYeOHitWRhKNUG5cAzDusab7FgUvsJKjl00G5p
         jsgsJkjOEm0JnU6S5uc3ln0B3OuBedgN9zGF3rFBZYRivstYeKc98BOA2RWzKD3So+G7
         DXmvIunPMOcE67UYK/HT2IfDgF7EIwyCOFQE+9wouXcl9pBSKiEoSe0lCKbtxqWD8MbB
         ylMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d12oPKQYmPRZxibcnnbYIKPV48P5kQ/K2Jm+dOK55is=;
        b=GG6PVJhW843v3yZlv6P5WU69gOT13/N9Bgh3W6GkCev9tF6YMIuoeDvfANz2vwSn9p
         PEfad79K35u7H+pnLuJiVrwwyaXmNLyl1zHzyR2BqjFp2Lioiv9wTluL8v7CCOMVE5ZQ
         RiVBnbEoUQ5gaet1WcA3Bm8Xf/Irp/yifBzIF7LGWlnAWh2L0BRn5qN/ncjmpKJb41jG
         JQ4FazZt45snEpSx2G+vI1nd735cG2Nfzjp0/95GJEVXb6XVtcSxlg9opiEQ7q+fwuXf
         yNJx63wzzwj2XwlRsQfE74lw15EBhCxLWeHdKsqDZMn4J/Pw3i7PfGYHaWtOKdBiurRa
         vOhw==
X-Gm-Message-State: AOAM530VqPG2odxFMfNIWEdm/ceInNw3fY1ICMQWOPvBSIuH8nsxHhSf
	4JmagNHRHt/pHyYP58CYHeU=
X-Google-Smtp-Source: ABdhPJyxQLLRTF8KOCrmgAYDavqLophKNRQ1oPCeDiN/A4+OQ9+KbKWT1VjMYbVZkigPmoU/6S2U6w==
X-Received: by 2002:a50:cd19:0:b0:41d:709f:5c57 with SMTP id z25-20020a50cd19000000b0041d709f5c57mr2840304edi.227.1649537942862;
        Sat, 09 Apr 2022 13:59:02 -0700 (PDT)
Received: from localhost.localdomain (host-87-4-4-217.retail.telecomitalia.it. [87.4.4.217])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090626c600b006e74ef7f092sm8251298ejc.176.2022.04.09.13.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 13:59:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liu Junqi <liujunqi@pku.edu.cn>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Leonardo Araujo <leonardo.aa88@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] MAINTAINERS: Remove D. Kershner from Unisys S-PAR maintainers
Date: Sat,  9 Apr 2022 22:58:57 +0200
Message-Id: <20220409205857.32083-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The email address of David Kershner is no more reachable. Remove his
entry from the MAINTAINERS file for UNISYS S-PAR DRIVERS.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba405f6ec31a..3b7497359c2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20188,7 +20188,6 @@ F:	include/linux/cdrom.h
 F:	include/uapi/linux/cdrom.h
 
 UNISYS S-PAR DRIVERS
-M:	David Kershner <david.kershner@unisys.com>
 L:	sparmaintainer@unisys.com (Unisys internal)
 S:	Supported
 F:	drivers/staging/unisys/
-- 
2.34.1

