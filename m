Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620721FA6
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 10:36:35 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id p15so36423676ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4PcsMg+q67rUY+iwTUmqhjT1/lhzigUjVIV5oK/dKWQ=;
        b=MWjq2X3LXfOy9aWDfdMxrIpa3BKedC4klyMHBw3bmnWe7Tve27AEctjKwz5Nn6mPnz
         NeRaifIMQDGdTECwFcSVeSE0ZTtzfxfmFPKPXQI6TdZiiIZ8FU1GcLHC66r844TWfXNA
         2hNAM4SPO94hgWlIjWrQwPjOom4mCEoWh4XQ0qdyVN7gM/E2MYlKMXVP6Mpv2cdvIvaF
         yIBcKAe7O6Mah9lRRHG36sW6/8dbphjP5+4xqsPdtMpHMlPxWOyLDxya/pb7HCRhKGur
         UoycDElxIgfRUe2bfBKFieO35Ld1dTnLILjQWdIsdvmoIx+L6L5zOTr6MeUUXwolzkUk
         0aRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4PcsMg+q67rUY+iwTUmqhjT1/lhzigUjVIV5oK/dKWQ=;
        b=4pmfZQUBSBf50pHSKuYJwApLT/dicBzkp/39b0K6aNWwIDzZ4mV9jJrPG5BAAkKwCT
         7HoClIJLrigMGFb1LDidDtlx32rMnlV9RFXK+Ji8ab50yChzvm0gOg6WMXUxOXg7Gmqc
         4urOjetHhht0DWnNSjrt+XjO2J0pAVWpxPTcd0VQYRtD2NQNEdzWzwIn1+I/a+KWSj2B
         XAB72pieQoGK3tMZIC8VnqVY7CnT4E+RiempwdVuFizOi28Sk7YNDxDUrNPOrJ7o/EkK
         Iz9DHyBlSB+dRMsrm5zQpOPbSjwo6/w9Li8SI7xRqSMdUFWaUZJCaKWHll3H6nXSj0Vt
         QNFA==
X-Gm-Message-State: AOAM530S6RJ1PQFDORDe1gzF2w5nBAXQE+X0H89v7JclhdPjdvz6gJ4m
	+Q3W2eGNw+Ca5DF+G0+4/MI=
X-Google-Smtp-Source: ABdhPJyWCclXWoRuMsc2m37Yrqt4HQVOqNDv7jXpsEhBrDVXdVN+L5thfGR7t3HzdtDEarE5Y0YpsQ==
X-Received: by 2002:a17:906:58d3:b0:6da:bdb2:2727 with SMTP id e19-20020a17090658d300b006dabdb22727mr33698192ejs.549.1649759793668;
        Tue, 12 Apr 2022 03:36:33 -0700 (PDT)
Received: from localhost.localdomain (host-82-60-208-254.retail.telecomitalia.it. [82.60.208.254])
        by smtp.gmail.com with ESMTPSA id o14-20020a170906774e00b006d5b915f27dsm13032798ejn.169.2022.04.12.03.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 03:36:32 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liu Junqi <liujunqi@pku.edu.cn>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Colin Ian King <colin.king@intel.com>,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] MAINTAINERS: Remove D. Kershner from Unisys S-PAR maintainers
Date: Tue, 12 Apr 2022 12:36:29 +0200
Message-Id: <20220412103629.8029-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The email address of David Kershner is no more reachable. Remove his
entry from the MAINTAINERS file for UNISYS S-PAR DRIVERS and change
the status to "Orphan".

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1->v2: Change also the status of the entry to "Orphan" and rework the
commit message. (Thanks to Greg Kroah-Hartman).

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ed62dcd144e..9283c63565b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20184,9 +20184,8 @@ F:	include/linux/cdrom.h
 F:	include/uapi/linux/cdrom.h
 
 UNISYS S-PAR DRIVERS
-M:	David Kershner <david.kershner@unisys.com>
 L:	sparmaintainer@unisys.com (Unisys internal)
-S:	Supported
+S:	Orphan
 F:	drivers/staging/unisys/
 F:	drivers/visorbus/
 F:	include/linux/visorbus.h
-- 
2.34.1

