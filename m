Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A0214D2AA
	for <linux-staging@lists.linux.dev>; Thu, 25 Apr 2024 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064369; cv=none; b=hHhizmkj6pXc9caj2S2qu8jJlahYHQY+f5hu+PXa4mmVSoViJDowa7a3BS3z89eWOMT6KqxraTT2WHvalnZQ2zkYZxb2g5xIvEQiIhJSZVbIP0YmofkTfJjGry2j5kSVgQbHUhMfj7U51fz9DoUcChcBL9McYZZT7gBr/6XRM34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064369; c=relaxed/simple;
	bh=QPMFYuJ4Ei9IBTE3GqCmtqSGWhgu+6h50h9Muj+5njo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Flw/jpS1Jm/vG+yrumljYvFxlr3Or7TUNI/2lgkz8tzpftQDllGsZXMZZb5zIwAhO/VMev1opEIGAOBf//UN7NWT2pg2thDtw0+C/vHR/JNuWTg2mZIaXuR9rXs6zOZMIGk+5K3+9pf4Z3wBqwa7JCi3y+2uusXS4x8DD/IZMK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=DaQj8fgk; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="DaQj8fgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714064355; x=1714669155; i=wahrenst@gmx.net;
	bh=qxbEz+OYjkfKXFV1gUswI7ZceQqaUjKdCgHNV4HXajg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DaQj8fgkNmsbDFD7MMBtLJzeP6jCOpYZTjWj7/hfcA3odkSRvfBeTmL6V4OCOf/T
	 4Scv4++nX72hABDyBmkQiGplBFPc9I/eF5vgGFHLaZyermHBQww+ocOfwifSP1+lT
	 NzcIF+rNtIVGeUvQxPCM5j+JOI3grtpsyo2wE95h4F1hRj667yBkVXqwRzhl07k5q
	 mYT5T6NP1i1OAoeFu7Om1W0f0Gi2Ets4+nmhet65ao2FBAVVeG8BYuZ9gZJxnVTsx
	 +zqy4hFVlnLqDh0yzJO20m7k7Uz119s4ebvfyi0CSNyq5B9eUKq6YEoXG5fhgmLtM
	 qGkFv6XhwRLbzzrjfg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1sJMVs3k30-00PjqW; Thu, 25
 Apr 2024 18:59:14 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 2/5] staging: vchiq_core: Use printk messages for devices
Date: Thu, 25 Apr 2024 18:58:49 +0200
Message-Id: <20240425165852.6681-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425165852.6681-1-wahrenst@gmx.net>
References: <20240425165852.6681-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cd7rHLvt5pHpDdQEbBWy4OYx1oqQcqVOfqkrjV4LM7ueZm1902V
 dvXGoedOggvt3H6ezl47JIY2mGwRnWXjIiGPWrE5oWXw+xJdrIY8JMw4FbPxzsamiCjWqvA
 PDDgD3WK5WvDVfgUPAeEZFJW7gvidgZsP4bDBEf10b/TAsZo3h0+UGP2+obdpoi6NrpeWP+
 Cot2BuofRNMp7o5X3HC0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZI1hX3BJO34=;5f0rW5JSHuGRdOKUhyOzyajOZEs
 PVHVzO+w4lp2bh2ByURnO+NaXIEeMUrofBc0sBwAsg93jAdnVPdkUIkGuPYtM8na1pGgmW9JV
 7OMQ2Y6FPzbzaTGnDq30NaETAzxRsd7wHWGmbObomw/YOj8hh5OMXdaHaWhngnqoWwj8ke+f5
 EFp6HS/WRieLyZTVuftB91k8wv9xhLiPziWvq1v1/v/JmGTbXQLL3v1GV+Wd2AcyV8QEOyWf+
 fUnyuL1s8XvTfGTMGpjw5dGZFQI45XifjFizdJfkpYvlAYZzoIm040SMM76QC35Jdbz4cQLiQ
 k+NBMNSIdxD5V3NYJ1dLKqDE8kYPYdqeSAWQDwL/XmlL6+LrMavKkSQN5j5/mBlT4PhdJV12n
 oChMh1QQleaWA8PczX5QUJlWTVnGZDe1Eh+dwmIV+b+2asFi1j4nG+2R1zT0beUcwcOlrOwEN
 PbZKbkK6ZpGsuDFpiOlVl/CAmT1Jo/pKq9KlFNQbIpSkw+XN2QO5+hrGxPiy0rYjHi+OQ7gWN
 PE0UWHDI1w3boBI7nObJ93uohIeFVJeAEFqeWrfNCxV9EFep01pfwS70I0UqztOpnzJnxd+bp
 2+IuqfX/eLYAolYJ/laIubzC/cJTgPGV3fa8H4K5Hj9gse63jpnt/rNrqBhWZSxx7617TDm9u
 XOba7IZbN4qLD0VTF8/QU90FUYhoAwIwfRM58EOUYGgvphuuk11OpTymKk3QYs2stsWuPtbj4
 uhbvCrXSvu/Xjm7v6y/jeYXZIJh5LatJcX+OvT8Z4zqNAHFz9LxqfDScJmp1Z/W6otACLenx5
 eQ00S+xA0Wjh4g+Y5ejV0kYeFCKfQ8yVPrOd+LTe8080Y=

Now that struct vchiq_state has a device reference, we can convert
the remaining printk message helpers.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
=2D--
 .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 3397365e551e..129d73fec2bf 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -697,7 +697,8 @@ reserve_space(struct vchiq_state *state, size_t space,=
 int is_blocking)

 		if (tx_pos =3D=3D (state->slot_queue_available * VCHIQ_SLOT_SIZE)) {
 			complete(&state->slot_available_event);
-			pr_warn("%s: invalid tx_pos: %d\n", __func__, tx_pos);
+			dev_warn(state->dev, "%s: invalid tx_pos: %d\n",
+				 __func__, tx_pos);
 			return NULL;
 		}

@@ -1732,10 +1733,9 @@ parse_message(struct vchiq_state *state, struct vch=
iq_header *header)
 				break;
 			}
 			if (queue->process !=3D queue->remote_insert) {
-				pr_err("%s: p %x !=3D ri %x\n",
-				       __func__,
-				       queue->process,
-				       queue->remote_insert);
+				dev_err(state->dev, "%s: p %x !=3D ri %x\n",
+					__func__, queue->process,
+					queue->remote_insert);
 				mutex_unlock(&service->bulk_mutex);
 				goto bail_not_ready;
 			}
=2D-
2.34.1

