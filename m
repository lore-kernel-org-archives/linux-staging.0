Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624E72ED165
	for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248462; cv=none; b=LGCPWKQPRUeXmy+ztned8WXv5hW7VLq3r+ESWnYiwCPDAMCG++BpeEg8mCnwa5KQWcrdLSu/4VPSWZXvnJZvxN/RnUPYb8893J9EaKAjxw7Ghaijqvn3LQa7CkubteT72BCXi+zzeWK2YnMAyCupoo3x4UTVZZb1Km+Ac1Sx74o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248462; c=relaxed/simple;
	bh=nKd3YqfucpUVGwkJytl2AoRb2Teyt0y7Je/tX/1Z0ew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=STuU7aPIGHwr/YZahNSD+9UEYsURpnjQc/qqAmCt19udhGxSMCHzt5s4U3WIUy/FB9r74EgYWtDfC4VeRc4AniIyqGSUvKxj76AHfk7UAxbqJ2O8QihQw7OFV5hlhhe+WSodyFJJ3ygD0NGCQ9l7KysQm8tzP4n6hRYgmlnfOvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=oU7isWcC; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="oU7isWcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752248449; x=1752853249; i=wahrenst@gmx.net;
	bh=brFnAh/YUrEXC18snDoiMV6YgR34Ku0ps2YTOINPKp4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oU7isWcCDPrUs4R5IIi4gjbvyhmb0Fp4q0k2lpfKuvDyP50eCYALMhExwCwHX7HQ
	 Zn7D469Uu5VqmRV+TnRhN517+YqRMQalTsGRrnBX3AkGaB5GEZrNjdh/GJJmZ0KKG
	 oA4GxJusnOq0VaFdo78jEJZWCIkc/pdZxisYnJ1qAznanP17x41Muf/h0egGpbyuI
	 xYftjH6TZxbQ1aSdSBeaBPnnQ1yEmW5a48QYh4UjWGuhSppP+9Kg86JfcpUt7o6Ex
	 AVBBMmgD02mj49lBUMTyUdEX26gPmOjWQeMhKGbtkz8Sn1vRb94mA+TFAinuJttCc
	 XjrNOng5AeFqqFAaHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYLa-1v7Nkk34Zc-00egZv; Fri, 11
 Jul 2025 17:40:46 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
	stable@kernel.org
Subject: [PATCH 2/3] Revert "staging: vchiq_arm: Create keep-alive thread during probe"
Date: Fri, 11 Jul 2025 17:40:30 +0200
Message-Id: <20250711154031.24178-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711154031.24178-1-wahrenst@gmx.net>
References: <20250711154031.24178-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iQ+mfMQgYDa4LGt86vwa7KXqc4RyIl/YZQLn2lRdclPrN4+ym0t
 Aw9K9dBAv5avBRVSqdv9m0Fm+XMt5eVye78UNFAknM588p8ReH4OtTKs/wUQiDDNtmrFSXJ
 WsoK6DeyIoW0jn0rXfn8vF9CjI+Unk97euwnO4VNnx6vbeGA+1qGuWEaXJJgujvP7Ou4xR0
 OzRtFbW3v8AXEvrvGkCxA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:txfjVgtOJtk=;LjzrWJ+2CEwpjNsjQNsQyodP0KP
 xP4/61mL5DOpJNtk71rOfVvqGGTDsdBH1mbPaFfjtd3OoAeu085vgcra5NS+Q8Qzcz8/OJLZV
 ZvTpNyc6zueGS4gtKr5hBuPkxjkrzkmPw8FpzyXNAWKPalYqOjuNjMvBc8ri3I88GKhGTHsrG
 YUZkYZi6Ggz0M827HqGsxt6Xwguj+XaJL9NaPlPvQ+D57HpuV0z1dugK+bpPk2JgIqrlbd+ka
 wpeYLxmjBsmcuC3bQ7/ab0aKNXd7kWZPDpPGdQxUoInbkWTWVEVeIDghEent2cn8t6kYaI3J8
 dJHTrS+1kJV8cae5GZ3NolVNOo2uN9Do4vnU6/WhyPPQf5/KvYxd+NAu/3BI6aJj+eU91qXNh
 iuqXGPLXvq1sU+W7NxbfiYDiDUVKHJWZXvsChhFz5o09eFz/KIJBYUDV4bj8biR5X2Wo3REYJ
 neubKER05dvkdxuKoJytYSdL+ZU7yY1jwKD0IZx15O24vX2R7mOxgeSpIl6w72w4A7II0xOxT
 svZQSFXQ50qNXCPFVoRtYU6kNtUCjbEE42u+iIndrFHf7ZV1IOqojV4by/vw22DhZMSwOAp98
 ghqujdfn77siB/9+8alv6rfAK/pNQVcQKnMxAQIHn8w9ngc2OqKbZ84Td7QHpWhssOt+0fzxe
 s844q9CQ/m9IfBuKiOehga40iRBBy9Y/iyOj+eFiRwOd389WxKqDCqGFOJT2xKu6fG2rjEn3v
 jQ1YTYFipL4JFTuV+tXBZExIceQHKHI6M7U+JwmgQNojQs/T5i+wJbkIICFlfY2wHAOVozS6B
 pwffJWUJGiW59QjAK2Gqexjoi7mYXGjSy+QakVKzj1BbnXHI+0S3MP1Te4nkrtlcy/kW0XYam
 OR67s6V83Asbq3CLKntYEIb5gWmupTBB/es3G4DLpWTVQDSFnSpdNnA02Fpq1MBz8N8LvJ0Im
 v8t2BiZMiIjGuXdrM9VSpKFwdUFxHEOlxdjeoV1pVh2EuRTOW1B3ejtQvF6kDmJtWzqMv/ClK
 PsP2+5Y54Rqi0iri7T6aHg0hRrhsHCzwv2SegSCjVowkHtLlNyEw+kelmJrjQQ78GXdDX71Bm
 5nICiBtL4JE6MJyMtcsLOyw0d5SugAklEv51SYhyTP1tx0C6iwTc5IM45V5tdCkA0rfUSo9dx
 kEir1b9QzvpUAW7xOU/SpObrK5qyeETRiuPOeVFUz1rNLG097Kgj0UnMq2lFz1nLnbJ5ciUZO
 RLdr7vEqXcb0V4VVxe1YW+gQ20y1+OuXUTmJ5WrA6LzKrP76fIb16bZIi0rI+MR5FZZOWXMKi
 +Uzntgzisi+e6LEa3YaOc+1LdcvWPkC/TiRk2CqGY+MCpaarLxm3kpRb4vBZ49IS5ISrQndPm
 wmT+ue8TQJKljJiz/K36rHtfs0I3O3lOSuP+1Lv0+i3HAwFXNcNHL+X6CVQOIHZxKCskwJx8e
 MnNT75fQW5lrZ4z7se0KXDQGVJudZmQpyDpwqVZRu9WQoxGZgdA0OOCV3O2iwyD7H2XoSbwmb
 aMQ6Ah4XYLgBNtEtN7f3PVliZCvW3f/4owBS5kmoU/8hK47aov6ugUy99avxyngZw4JycXqKC
 vk9oFA97nutPF0BaFsgdStPHRXiLYA3/nu+FAPA+3Ox7Ktus0gIA42ZDSAkYB6b3rSIW+UdFr
 mJOB6DtYXi+C060BBoXmRClU3cr3Apy9Q/WpOYOjjPHDMgyPW0zlbVXH9zWuNmThpBerMdH55
 E7LW6ohSvXluUj1J62mGZUDHDyPL4ekTx0dS9+ZSEx+bXeTG6FA2pwS3hmVmSu3iD7U3EYTQ3
 VnOlUaW6jlbzmV8ynrgtIv4iVZ/P7VyDXKoqscB1QFW7Hv1he2nKydXkUbsjkHlUmQBM+vJW/
 6sk4n+YzFq/uYI1Pg6ES1WazFBA2cfrhKk5IoSU0Gm0FunKLpNKtkdZVLDOCCJrsOGStdcyY2
 4i9QTt45kuKpnzjIoFME+iK+bG31X9g54pydzogIbcO+hf58206UxaJhc4rNIsZQstTiIVegd
 KnBfFTXWkX7miPuCDhwDaEh24nm7DCS8gfkWHMFEuhgg6bl5tnsKSxiH5y0xH1ykQ28DrPkzm
 9DHjONsEsdH/MRpod2bswz3dRvCuOGHTGztD9kCdvnSNpaHOEmxjjyTQNCno/9Y7YFzzFHT17
 wDpHCjkL0syH+W7yB7FPz1OsO+7d9o1M7Wqw9rUOtpH/tSW4H8vXZvRuxb0iBtdF/Fsk1UOSs
 Qpq40TPfdPJaGhQ6BVEK0QdS7bY69fTOdbCPL52wcEkm59MEvRSentPGViYStlLTrmIAspCqa
 eioyaOKKnybii+PtSMxtxaQ/2N39eVKrKBe2QKQnp5gO4HFxjUKfxm0rbUspuHzx9qyj7OFvr
 sZLJTh/svfJiMXFm3MQAZxcmm91kONYzKGeSmZ7i9BQECQbL1pr2z+Hph7u0DfuEb+wkQ4xXH
 +XwOJfRES3cw9yR60c4pxUL9pxZENBJCMsOr7B0a0Qx2m6H7YkahDO1O58NYpZz+/816O9hBb
 oRSgM7gkNkB9OcevOxvlBmrxMoYQGtB7YsB5OeP3+WwSgbgaNyIhPuxQ699oH/fQkNRG+qz42
 UGpv9dK2lQevFMiD/54xzOYgeYpHxl1Jo+JDI+CfsUteL06wiVcveleFPdhBaf0LVFURlUpB/
 AAhK8cqjMjWPqDqPUYmAARoA+TZJDisZp1ftgHZGrJBnLv5kA3cGFkB4mmuXFur50edDlnEgd
 pT3qUM4zObjax5gj+rGXLw4tARQq3R00E/qMZXjwyCHsxg7PIg6x3MuZxParwJm/2Pg9xTCwv
 Otz/m3Qnyj3qkXeNBN1Q59Pd3vv5Wqe/e7OkgqCEkVNAIVfSDOAkHY3+ckn5XfJZ5x4iQAw/f
 5vKzVtKQFPuqDQ3fOB/kSu+I/AXdX7chf+1BJrVu8nVnEAODQIVg/ULeHjGzyDD6V/lQGLkpC
 wbw15XUogOwcVoDmiYoflfGRDoRxjM/3yYLDagyEeuxa0kz6H8BoY9qeDT9j3QVUq+7wUbwil
 CDx4jdco/A2xixPF/voKnk5WVVwQ7dBLfr6rYXlb8eCW5Zk03BA92IELHLuEve7Jp0ZZ13F0K
 m/0QpwEUFcJUAw/OEF+JMdToObY2KAgOfW2apzxUPoCuhXtuq9yK5ERehse8aid0OvJTsZqGe
 RA5SSdeAIpOKkWpT8b6/O5+XFBQsWJWSk8BjUIlDB53RCcf/Aya7xxy8h9fu8wPYb/xF30bFB
 hCNP9lNCNrfVGqTOA8b05xwaa0oUHqviqlw8ppurUJZrRPiy1bZghfLDe2uS4Shbyjmd6jcM0
 QDcrcoovzVaLYLdCNUGIJIBIlYf+QuUJ+8qLUyUqvVsW4G3JfbSaLj4ZNoQ7lxzTs7L052lrD
 LgFIy4ao2ERhAToP+tltMAhqrVtLhD2ojuxwOumqzZG52/z43FuYevgamz7Zci0djDRRwxkYp
 aSSFWNcd7QxiBhetrvAi0rI4931Zur5wYp8DbDUbt02AI37z00T1Z0jDTrm7Q2zLM91Pnpmti
 +bss/He3eO1wu5u2qFdjnCJcJv9Sm9oFQMaKMG+w30Sz+eTo3GBpqdRztkb0kVnKKqaOf7HPZ
 n+jxX+WOIvdSk7k/teH3y5Bj6FsQ1MOLrwKTC42ul9NU0+iAHrG7+wap4YdIO4R4bd/qHv14y
 uQr2Q=

The commit 86bc88217006 ("staging: vchiq_arm: Create keep-alive thread
during probe") introduced a regression for certain configurations,
which doesn't have a VCHIQ user. This results in a unused and hanging
keep-alive thread:

  INFO: task vchiq-keep/0:85 blocked for more than 120 seconds.
        Not tainted 6.12.34-v8-+ #13
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message=
.
  task:vchiq-keep/0    state:D stack:0 pid:85    tgid:85    ppid:2
  Call trace:
   __switch_to+0x188/0x230
   __schedule+0xa54/0xb28
   schedule+0x80/0x120
   schedule_preempt_disabled+0x30/0x50
   kthread+0xd4/0x1a0
   ret_from_fork+0x10/0x20

Fixes: 86bc88217006 ("staging: vchiq_arm: Create keep-alive thread during =
probe")
Reported-by: Ma=C3=ADra Canal <maira.canal@usp.br>
Closes: https://lore.kernel.org/linux-staging/ba35b960-a981-4671-9f7f-060d=
a10feaa1@usp.br/
Cc: <stable@kernel.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../interface/vchiq_arm/vchiq_arm.c           | 69 ++++++++++---------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=
 b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index cdf5687ad4f0..6434cbdc1a6e 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -280,6 +280,29 @@ static int vchiq_platform_init(struct platform_device=
 *pdev, struct vchiq_state
 	return 0;
 }
=20
+int
+vchiq_platform_init_state(struct vchiq_state *state)
+{
+	struct vchiq_arm_state *platform_state;
+
+	platform_state =3D devm_kzalloc(state->dev, sizeof(*platform_state), GFP=
_KERNEL);
+	if (!platform_state)
+		return -ENOMEM;
+
+	rwlock_init(&platform_state->susp_res_lock);
+
+	init_completion(&platform_state->ka_evt);
+	atomic_set(&platform_state->ka_use_count, 0);
+	atomic_set(&platform_state->ka_use_ack_count, 0);
+	atomic_set(&platform_state->ka_release_count, 0);
+
+	platform_state->state =3D state;
+
+	state->platform_state =3D (struct opaque_platform_state *)platform_state=
;
+
+	return 0;
+}
+
 static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_=
state *state)
 {
 	return (struct vchiq_arm_state *)state->platform_state;
@@ -988,39 +1011,6 @@ vchiq_keepalive_thread_func(void *v)
 	return 0;
 }
=20
-int
-vchiq_platform_init_state(struct vchiq_state *state)
-{
-	struct vchiq_arm_state *platform_state;
-	char threadname[16];
-
-	platform_state =3D devm_kzalloc(state->dev, sizeof(*platform_state), GFP=
_KERNEL);
-	if (!platform_state)
-		return -ENOMEM;
-
-	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
-		 state->id);
-	platform_state->ka_thread =3D kthread_create(&vchiq_keepalive_thread_fun=
c,
-						   (void *)state, threadname);
-	if (IS_ERR(platform_state->ka_thread)) {
-		dev_err(state->dev, "couldn't create thread %s\n", threadname);
-		return PTR_ERR(platform_state->ka_thread);
-	}
-
-	rwlock_init(&platform_state->susp_res_lock);
-
-	init_completion(&platform_state->ka_evt);
-	atomic_set(&platform_state->ka_use_count, 0);
-	atomic_set(&platform_state->ka_use_ack_count, 0);
-	atomic_set(&platform_state->ka_release_count, 0);
-
-	platform_state->state =3D state;
-
-	state->platform_state =3D (struct opaque_platform_state *)platform_state=
;
-
-	return 0;
-}
-
 int
 vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *servi=
ce,
 		   enum USE_TYPE_E use_type)
@@ -1341,6 +1331,7 @@ void vchiq_platform_conn_state_changed(struct vchiq_=
state *state,
 				       enum vchiq_connstate newstate)
 {
 	struct vchiq_arm_state *arm_state =3D vchiq_platform_get_arm_state(state=
);
+	char threadname[16];
=20
 	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
 		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate)=
);
@@ -1355,7 +1346,17 @@ void vchiq_platform_conn_state_changed(struct vchiq=
_state *state,
=20
 	arm_state->first_connect =3D 1;
 	write_unlock_bh(&arm_state->susp_res_lock);
-	wake_up_process(arm_state->ka_thread);
+	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
+		 state->id);
+	arm_state->ka_thread =3D kthread_create(&vchiq_keepalive_thread_func,
+					      (void *)state,
+					      threadname);
+	if (IS_ERR(arm_state->ka_thread)) {
+		dev_err(state->dev, "suspend: Couldn't create thread %s\n",
+			threadname);
+	} else {
+		wake_up_process(arm_state->ka_thread);
+	}
 }
=20
 static const struct of_device_id vchiq_of_match[] =3D {
=2D-=20
2.34.1

