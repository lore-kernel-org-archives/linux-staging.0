Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240A93FE3
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 11:42:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30565611C5;
	Thu,  9 Sep 2021 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631187725;
	bh=RbQK7DXt1AUNw7ujUS0IVL77fwIheGxdH1R23y+YR30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nh5+2H37NZ301CTnzRJd1ZS79NMFICAEqSsyXecv86ZaTogCZyFQ1fiCDyJoNM+Ke
	 siPGtt4tonwf/kzanFZ8mTUZxw5Hc2ADS0J0hNFtDkFii4vY3DMd4IQhJ8A/p/Xm3O
	 BkIHigh30KWP5UFUuv9QVapW5JiOuSiEd2eOXM0qN4+6g5wlr92PLt+JGLW3QRdzKu
	 cv6E3HE8LB+RUnQ7UCj6WY3ePkaFt4H8rVAahIxlzqAopBDv67MQjpyRuAQF3qPEds
	 OercuzPjGCqB9IHpizXV8RRfO4JG/lkHsvxf4E+nVsTENJvxyPml4addKaJOZ4tj9q
	 drbMdtOTALusg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.14 046/252] staging: hisilicon,hi6421-spmi-pmic.yaml: fix patternProperties
Date: Thu,  9 Sep 2021 07:37:40 -0400
Message-Id: <20210909114106.141462-46-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit 334201d503d5903f38f6e804263fc291ce8f451a ]

The regex at the patternProperties is wrong, although this was
not reported as the DT schema was not enforcing properties.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/46b2f30df235481cb1404913380e45706dfd8253.1626515862.git.mchehab+huawei@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml b/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
index 8e355cddd437..6c348578e4a2 100644
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
2.30.2

