Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98E372
	for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 09:13:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67D14613B2;
	Wed, 14 Jul 2021 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626253985;
	bh=CvgsRWOvpdhYc2CPuXHiO8KmPrKQY0raxwB2Nd36tUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S9cMCc2cJBYPljpqMDkwoetrYHG5ivgwEK3JamQWYeAbDJGM6pDI6geQtXLn6iLWI
	 LtFFNdzLE5qA/vmIK8FGCQdACeYh+9FLzcvmZhvGEFyMa6DFPmr9Bf4vUv14EhuVcD
	 7kxs3zSsAkiKK5vE+CcHeGj9GuJrqiLYMd0tV52JTcnhfJJoEjA/++bQKbgl0PgzC1
	 QgD6CJFFOaTQ1u3NUExFmZOm4InkPwlQt/aM46P2y/mnEWdxFcvw8XpKgyOB1jEciF
	 lNFHN/Rws+ll0HkIstST5wEK8Z6RV8QvLd4oB5TFNoyB+KKcEORmJsqAwn+UBK9UVC
	 l15QOggRnoybA==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1m3awx-007q2b-Aw; Wed, 14 Jul 2021 11:13:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v13 6/9] staging: hisilicon,hi6421-spmi-pmic.yaml: fix patternProperties
Date: Wed, 14 Jul 2021 11:12:58 +0200
Message-Id: <223da345b9f27d5e8f439b7d0594cb0128edcf16.1626253775.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626253775.git.mchehab+huawei@kernel.org>
References: <cover.1626253775.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The regex at the patternProperties is wrong, although this was
not reported as the DT schema was not enforcing properties.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml b/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
index a2963bea87ea..b06131504d75 100644
--- a/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
+++ b/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
@@ -41,6 +41,8 @@ properties:
   regulators:
     type: object
 
+    additionalProperties: false
+
     properties:
       '#address-cells':
         const: 1
@@ -49,11 +51,13 @@ properties:
         const: 0
 
     patternProperties:
-      '^ldo[0-9]+@[0-9a-f]$':
+      '^(ldo|LDO)[0-9]+$':
         type: object
 
         $ref: "/schemas/regulator/regulator.yaml#"
 
+        unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.31.1

