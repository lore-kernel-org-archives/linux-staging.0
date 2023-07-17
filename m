Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B4FBA49
	for <linux-staging@lists.linux.dev>; Mon, 17 Jul 2023 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ajwKRqTU9uD79sJ8dO
	UBgyqsNK5fBXvdgYT31//zJPg=; b=FDO77mgyHNrh2FM7QjMpgbfm3oKHdnxy/u
	aLasFVSprgPg3h6p1suiM4j0mrKlUFjY4Wx4TrZ9tVSpvS2DfNCuiaXay2l5mXaI
	ksLxnISsdrhoxFnieRgml7AOrxh476/UUULOgwAxauA7L2KK1UA2G2Es1/sM6/ep
	aBZa3NKzw=
Received: from localhost.localdomain (unknown [202.112.113.212])
	by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wBn5np2VLVkZX4xAg--.35184S4;
	Mon, 17 Jul 2023 22:47:24 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/1] drivers:staging: fix return value check in fsl_mx6_enable
Date: Mon, 17 Jul 2023 22:47:17 +0800
Message-Id: <20230717144717.23907-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wBn5np2VLVkZX4xAg--.35184S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWfGFyrJF1UuryfZF4kCrg_yoWDJwc_uF
	ZrGrZ2gr48ursFy3W7Gw10yF93WF4kZF4vg348ta13tFW7ZFn8C3yDXwnxA3y7A3929Fyq
	kF4UAw12kr4fJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNWlk5UUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBiB2v5VaEFzdVDAAAs0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

in fsl_mx6_enable, the second time of calling clk_prepare_enable()
may fail, so its return value should also be checked. the clk enabled
by the first invocation of clk_prepare_enable should be disabled
on the error path.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/staging/most/dim2/dim2.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 44d3252d4612..4204cfba6b48 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -944,7 +944,12 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 		}
 
 		writel(0x888, dev->io_base + 0x38);
-		clk_prepare_enable(dev->clk_pll);
+		ret = clk_prepare_enable(dev->clk_pll);
+		if (ret) {
+			dev_err(&pdev->dev, "%s\n", "clk_prepare_enable failed");
+			clk_disable_unprepare(dev->clk);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.17.1

