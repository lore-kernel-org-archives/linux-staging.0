Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD2B1851
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 09:19:54 +0000 (UTC)
Received: from localhost.localdomain ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 25E97S3I029619-25E97S3L029619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Jun 2022 17:07:32 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Larry Finger <Larry.Finger@lwfinger.net>,
        Phillip Potter <phil@philpotter.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Kaiser <martin@kaiser.cx>,
        Michael Straube <straube.linux@gmail.com>,
        Pavel Skripkin <paskripkin@gmail.com>
Cc: mudongliang <mudongliangabcd@gmail.com>, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] driver: r8188eu: remove NULL check before vfree
Date: Tue, 14 Jun 2022 17:03:30 +0800
Message-Id: <20220614090340.123714-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn

From: mudongliang <mudongliangabcd@gmail.com>

vfree can handle NULL pointer as its argument.
According to coccinelle isnullfree check, remove NULL check
before vfree operation.

Signed-off-by: mudongliang <mudongliangabcd@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 68869c5daeff..bd1c8b4b5c4b 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -372,8 +372,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 free_adapter:
 	if (pnetdev)
 		rtw_free_netdev(pnetdev);
-	else if (padapter)
-		vfree(padapter);
+	vfree(padapter);
 
 	return NULL;
 }
-- 
2.35.1

