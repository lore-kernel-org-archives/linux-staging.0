Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EA02F48
	for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 21:10:12 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id r3so769340ljd.7
        for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 14:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R4voUmXX2drgJSODM/AOB6lNYeHvu2UbFe9Rge8COUw=;
        b=I767hPJ46OgIVQdTE6a4ai/xgOIvEcKdHGfRG7PSAgeA7OqZ/D9aV9m1nUlizm5jGm
         OiLQpgHn+FhPy8yyJTJxFT9gS9tamDdHAZnJQ03O1fHMRR6q1UIh4SPu9YP29i13ETK0
         m94P3KxzB/C2QhiCfyoIoE0iw2zbIpwPjfWHvWFRJ4LXfc3sdfXTD3T2sg/5p5suJ4CD
         cLv3h+n5/1+IMs+O0y9lxiv3BjpZSuBkQTcrFRvWT+wJqsijKYTSmNvOolNFLA0vwUyY
         dWtj+wo7UZTPKLmn0HHKB4N17kKtVDihFiGoDF0r244SVkOaGufJR3ToMV3H67X4Vo0d
         k+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R4voUmXX2drgJSODM/AOB6lNYeHvu2UbFe9Rge8COUw=;
        b=CdyjL6a1i3RubwNCkEwZetwju4+LGcXuD/PmOQyLszt2YvOIa/qvzoqwfwSgB0AIa8
         PGQFqYKUlg4B+sJowUEvECFdPEGCeCHXEF5P9odXfbyJX8xFqkVx5EbUcPUqE2yPZpeH
         lhoWrxIUxzdvQAec2aI3zJmyG25MKSGfdwxTC0DSjPFpXrrCt65VFqyJGExJ8n+ioR3x
         ZGF5LSqns1d0GLHY1fhZPwqXDn+2YqxJkvJeUG0cZ7ZTJRT5+8Rc1KmvOuquaVosww/X
         dHNZxKSN6vrOO7eFDQoius22AoMR9UGuOjfOHghv1wbphPRBdERM68j/N7VThCkk5wGu
         TGsA==
X-Gm-Message-State: AOAM533ZLMIlCJTOHbHwsic91Ookt8q7fiWmZsAFop6OgM5VgikQBZ0S
	KNhAB2K6f+FJewWwtJaRwVCJwui4tCQVDg==
X-Google-Smtp-Source: ABdhPJwZVFtZxGg8enpZxx6q0WPL2VTnZKOfm81APVdQQcBl2zKXoBuU4vEknB3/Mgxkp2p7aJm7fg==
X-Received: by 2002:a05:651c:994:b0:253:c449:12f with SMTP id b20-20020a05651c099400b00253c449012fmr3735869ljq.413.1652994610776;
        Thu, 19 May 2022 14:10:10 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.4])
        by smtp.gmail.com with ESMTPSA id v13-20020a19740d000000b00477bd2d89b9sm400913lfe.140.2022.05.19.14.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 14:10:10 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	dan.carpenter@oracle.com,
	fmdefrancesco@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v2 4/4] MAINTAINERS: add myself as r8188eu reviewer
Date: Fri, 20 May 2022 00:10:08 +0300
Message-Id: <7656c9eb3d430524373f4826714f7d205480c3e2.1652993983.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1652993983.git.paskripkin@gmail.com>
References: <cover.1652993983.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I was reviewing r8188eu patches for a while, but I am missing some of
them, since I am not in CC list. I want to be CC'ed to help reviewing
and testing more patches.

Acked-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes since v1:
	- Added Dan's Ack. Thanks to Dan! :)

---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a635f2ae5b9..bd38a2e465cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18716,6 +18716,7 @@ F:	drivers/staging/olpc_dcon/
 STAGING - REALTEK RTL8188EU DRIVERS
 M:	Larry Finger <Larry.Finger@lwfinger.net>
 M:	Phillip Potter <phil@philpotter.co.uk>
+R:	Pavel Skripkin <paskripkin@gmail.com>
 S:	Supported
 F:	drivers/staging/r8188eu/
 
-- 
2.36.1

