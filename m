Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605F2FB2
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 07:46:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DC2E61425;
	Fri, 25 Jun 2021 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624607172;
	bh=ZO9EAEaYw/bHyl31+q2cZi/I7oBtV4iKluYTqwM8Gfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PYnxweGDhIJdJ0zhTxfGv0A1o3o2vd4VCspTkROM0aTEBEGu1+MAuV8W5+c6XcIFr
	 MKrGqToAIsuj9uCHW1OAGVY5mXM1Mkd7Ot5+3wtuSO7zIOEB2Qrv/YCRMDvfGZvM1i
	 LqBy4HVTCkscm3cSDdQuaLeGRhiPfz+DbGcg+OhbO0jdaiucubN5kouUzl8cXlcKXr
	 SLjzbLrUzRdXXBLOVgiks2xAl5oWOb9Ekyixcu/cfU3PhI55GqzuC0Z2VOHMthVKio
	 cn22hb2hebopSVSWcutrB8OLqvZ9Y563ln8kSM756LYnvS5iFpRaEmjxjgpVL8vtNC
	 2XKPo2DNB+jpg==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1lwgXS-004aeE-Cy; Fri, 25 Jun 2021 09:46:10 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Lee Jones" <lee.jones@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v8 03/12] staging: hisilicon,hi6421-spmi-pmic.yaml: cleanup descriptions
Date: Fri, 25 Jun 2021 09:45:55 +0200
Message-Id: <9f421e254061a42b7b598bd96b12f05460c175c9.1624606660.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624606660.git.mchehab+huawei@kernel.org>
References: <cover.1624606660.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Minor cleanups at the schema:
 - There's no need to describe interrupt-controller;
 - gpios need a description.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml b/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
index d57316c57d7b..8e355cddd437 100644
--- a/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
+++ b/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
@@ -32,12 +32,11 @@ properties:
   '#interrupt-cells':
     const: 2
 
-  interrupt-controller:
-    description:
-      Identify that the PMIC is capable of behaving as an interrupt controller.
+  interrupt-controller: true
 
   gpios:
     maxItems: 1
+    description: GPIO used for IRQs
 
   regulators:
     type: object
-- 
2.31.1

