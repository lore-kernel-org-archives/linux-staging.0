Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE848185F
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 13:34:27 +0000 (UTC)
Received: from localhost.localdomain ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 25EDWoU6010890-25EDWoU9010890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Jun 2022 21:32:54 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Larry Finger <Larry.Finger@lwfinger.net>,
        Phillip Potter <phil@philpotter.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Kaiser <martin@kaiser.cx>,
        Michael Straube <straube.linux@gmail.com>,
        Pavel Skripkin <paskripkin@gmail.com>
Cc: Dongliang Mu <mudongliangabcd@gmail.com>, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] driver: r8188eu: remove NULL check before vfree
Date: Tue, 14 Jun 2022 21:32:29 +0800
Message-Id: <20220614133239.147076-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn

From: Dongliang Mu <mudongliangabcd@gmail.com>

vfree can handle NULL pointer as its argument.
According to coccinelle isnullfree check, remove NULL check
before vfree operation.

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
v1->v2: fix the logic change in the patch v1
 drivers/staging/r8188eu/os_dep/usb_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 68869c5daeff..cc2b44f60c46 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -372,7 +372,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 free_adapter:
 	if (pnetdev)
 		rtw_free_netdev(pnetdev);
-	else if (padapter)
+	else
 		vfree(padapter);
 
 	return NULL;
-- 
2.35.1

