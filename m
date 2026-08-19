Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C923AE713
	for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154306; cv=none; b=VqoqEq/12m+Sz+Fnj1m3iLlOe+sNlOoHqI+tJw3ESnF3LkEB9FTVi2zBy4pl9zqTMUF/SZyc6cDpao9gt8QVXGQwCcD69izTtqw2FKT4NavIWzs9mdw2/k7uzDXmYUyq/x+yYEngd4d7EmQY1bnmgSP2lVeKB2RTz2Lzo1ZDwzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154306; c=relaxed/simple;
	bh=jiqnw6FUQrsZ0FRQBqGfQnQPHLpg4XhphZdoEhKXXHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=e2BUdWtrL0TIW+aLPxESh2Gj3MmPUfd556SwAQ5nW4hgYU7/+/CCY/7Xm2C7dz9HWPf17tsPcg1wZOqJSPgyrv+A8YuhK3+LZxCFxYFmJx8F8qgGm8WpeeF5sopFjViUwEeQaKROd7BRMjTdGiAaocl+0FrJWn18e9FKb8Ih4zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=ZwWna0Dg; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="ZwWna0Dg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787154301; bh=u4lunKqr7eTEqlWk2hHKr9aS4Fq2chn+Xh9I7/AJIgw=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=ZwWna0DghM0LVlRllwamoo3T3bdF+hsSqZDJrES2hmYWlMYsDjorDO4Qxv4gUSaYSxs43BtNZNUCRGiMHGCFvWtHh1AzSA8XQZW30+HiFexbew9ip3jYEzE2Wdt1PL41Al9OAdoVKunFMvLrEc+VvccuuHoJVxera5zTx1lzIASkysAbBPbeXhSl//l4IweT2n+HW9mIFx4ZwGPnJCQVE7Z2JjDtFI6Tt4+hZinNviwnyiRWk00O96h8H1ALhjNTcJFupmIyWCpmzQ4xdRKvOn+zfSMTYA15qebGEoOHzujfDiYsvSEwsm8WAisyOfLLjbiSl3JQP1yUUre54I075g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787154301; bh=ticcv5ML5zjqaHv9P7sURF7yx3d5EFI80tAmJG2xMMq=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=PrFpVblSrI/5YBt+IIXXLvWAq3jJnvhLIY4zNXlGfyG6eZT9LdsdoHJNzezOFTzFbS4juvXLvDMuGVz1c7E5b8Dr3tXqwSR+4hIsh+fdKT2s9MB1undnNnEX7GMJBUbMQSgTEpJaRnHcG4SUMgp6CH0n8/mFlT5Vr7wTzibra/O8zTODwJw9yhi74a4/dfDIzpf19yM35Y7akWXntpJQr3VOHh7ZzM21SpU2+Q8jj2ua+0mwVrjAv3T3Xt4buOR1E+BK2GOoRQNSUsjarnwCi9TIYq+qHhYyYAgu5BJiODprGmvUucmhMn82dizUSHGopQNtQ9xcp3pwhMkWg+cygg==
X-YMail-OSG: fJZX7pUVM1mfYwQQ11e9fCLIZU1cGWal.wqXMRz3VKeDQskeBW22y7fRGyGCwWG
 dLAkATMIAt9HSzYJB751WkKY0IBodOm1vAO0wC8riLqPmbSFGKVWKgCw.8TiPIzuRu.4Hh0qOdyd
 0UU2.YGPYESRTiIywFm.OX4a9EY0OWzWq.DSTwI.8w4zOsWutBGLhCBb8_4Frk00zIwEK8Imktli
 qyJ0PLHFfwcQGKaoPfkXaxaGNZZbfBOnJ53mU4tMb7VQe7xwWiZ2f3qSIxDE9BE7h067DJBa091b
 vRJo0NSgszj0okeOtvDxH93GAyG8ipajv.8tLqeDsRoAtZB7QkF28DKbv5vZTnesdVEgF4Hf6VZR
 MkJI9X1TejPPUK2wLqDI3OksEBHxF90NoJIDH6hfIn1ZFGt0EFx0J29zF08kHjBaLhhAk73HXWCQ
 yuYh0t2xb3hqzqJEKExmT5r8Pf_USJ_07QbmINwyiR.Af20niOvInwbvi0ra0a.KGaP42KwLJvXP
 VmllJdzA1Tcu.18jZmGrlMBAoEW3889NyFUy4q.3zbZm8DluyJD0gN3c0JcGrqn3WCANPlluBjSt
 Y16ndO77UVVs5UMpW2KPnPlQSP0uGU9eJ.qIQ2QHSjUQIK8xtn0JVape03uggx4E1BjiTWg_mIo4
 7GyJlSQes0T.0vyZJbHE9z9oYqZ0X7SpsZLAjrjl4KqOhPfB3r6f9A7dHOkl.rn04ZhoGZ6LMtyn
 EEcWRrELJBwPBVIQ7QQ..qRDuWA5y0oN51VRd_ivurCaLuBrg6o8imFIQ8vyzS2kMd9riFoR5_NU
 dowmBx69xB3BkW_PlV6IuLT6bNNr63TVWUR6ypt7ez9OIE7FZbkoxokIiLmsz_4CY2LgcmHh6Gt5
 vO9aDE9ntpLUbuzoawFKhYFOj3D6rsSLz4ZCrxkC0JC5Yk9vGzz_.GvCnbPWfoTxUPVZTOgAGGoV
 2e.nsUXne39XujL9HNhiOEIPbaDvRuUuLh0ex118_4wocjCNyTI5UCc46Ujzoxpep8pmT0fq7UfX
 Jb4ZkFz7NMHtSppPeeaAoL5FTGYeE6piH4z0UbUg..NavPlPUbPFexCNOo9OLJgthTa7KYfbFhNr
 6MSDpSdx_DHBrmxoCR.aULpZr6UqnWWBwU0WpNvM0k2PXPWjfDyCBkk31q6B6_bOv4RdpbaKl4_d
 Xlgl7sUwpCp7t1TNG.rUinwco9hYk5cFi8Sk8XBWty_is6RdUlmQeSfmuG3BoCTlOGoShRlhPb0B
 Zyk4X3wXjww2TOUAilAxf25uAypybMQT_muc9iP79cCSfjiqGFzMzfaxe1d3EPGaDsWcOnWwBl5N
 eFdKz1JU2E3UmKNbSl0xdQi8mHs6znVLfMlIPuLrA2Lx_2OgvpOhSeJENooG4_l8ykKgGNq8RSr1
 i5gDQOuv3xf4CQx1iZ_0IVGjb0fM5.ezVhJcYhOGfzBW4oH7DQl_J_5Vg_1fW7QKyAza.zh.UGxt
 3_lWMJBaEKqCK9Zn5qfGKVmvPkFyzyDzR.IzxDJjjwU6In3c_AHNzYhLw_2u5npCjJW3c6qfD9zw
 yPLCh.Zw8zUaLIiuz4ZoGN0Pk.iLYsnkBOcrn9kEzL2zOngDAVpwE4nMOIMOrS_NzK7BgKz5c_uS
 br4ACDQESpMM7m4z6zmr17IMszS4M8cXCXvyRXrPSlojR7mxRDQZwBnLxh3tubHqdnKcB_fjRoQb
 EUhArYh9uCiAd68bNfeVMkh8n59HEPlm2SzpL8UoCxybwArtG7qc0BPMQzSGKWWmNXn7SQVeZ48j
 ze8mzlTKrHfS.3cKh6MolGyh0QHWrDMaa.aqzLzdbMjQughfLYdtkX0h5OmdV7VOu5arvmIfgkox
 3oZiDjzb1tb7gEoyPOQokD7fE4PpxAYouyptxzHPiThoi415oZyQSYb7X0EsvO.7btV.MeLYxyqp
 GVBwlUGBfHqgcXMVYC_AsRnW0aaWinQUUNtrR1RKI3xSs2R.VczpwHoqolYuv4wd4_xdZnpZBYHM
 jlrDN_EOZKu.0Z1y6qDv9pplUj7czEuFojAjdoRtdcczFsY3ch5I-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 009fda8e-338b-41d8-871d-8e1eae65373f
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Wed, 19 Aug 2026 15:45:01 +0000
Received: from dip107.lsn.ir2.yahoo.com ([87.248.99.116])
          by hello (SMTP) with SMTP ID 967f650c72d009ff976bfe919548cc22;
          Wed, 19 Aug 2026 15:44:58 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 19 Aug 2026 17:44:55 +0200
Subject: [PATCH] staging: greybus: use sysfs_emit instead of sprintf in
 light.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-greybus-light-sysfs-emit-v1-1-43c4b680de6a@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTsJEKLoVYwLpv4tYxRNpxAJ4
 e4WXH6L9xYyRIXRpVgoYlLT95BRHQpyfTcEsN6zqS7rY9lWZw4Rs4zGTw19YpvNG+OliRtpBZ2
 cGu8c5fwT4fW7r6+3v22UB1zafrSuPxRSOHB8AAAA
X-Change-ID: 20260819-greybus-light-sysfs-emit-4b8beab74fcc
To: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, 
 Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787154297; l=2283;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=jiqnw6FUQrsZ0FRQBqGfQnQPHLpg4XhphZdoEhKXXHo=;
 b=MD12Jrn6GvSFdWlzPktsz3Wfk4e/DHZh6od5D/QOQaLl9BdX4+pUVYb6/E9+iZzO6jnEIO6L1
 3F4dOr3JM+xBoELVwiQaQb1KKpoTSof0FILNLFQkX4dRTpow1SGPfbF
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260819-greybus-light-sysfs-emit-v1-1-43c4b680de6a.ref@yahoo.pl>

Per Documentation/filesystems/sysfs.rst, new implementations of
show() methods should only use sysfs_emit() or sysfs_emit_at()
when formatting the value to be returned to user space, since it
is aware of the sysfs PAGE_SIZE buffer and includes sanity checks
that sprintf() lacks.

This fixes fade_in_show() and fade_out_show() (both generated by
the gb_lights_fade_attr() macro) and color_show().

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no errors or warnings.
Compiled the gb-light module successfully with CONFIG_GREYBUS_LIGHT=m
and CONFIG_LEDS_CLASS_FLASH=m (both previously disabled).
greybus.ko, led-class-flash.ko and gb-light.ko all load without
errors in a QEMU environment (verified via insmod and lsmod, dmesg
shows no errors). This confirms the modules load cleanly but does
not exercise the changed sysfs show() code paths, which would
require an actual Greybus light device bound to the driver.
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..2689f9a7524a 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260819-greybus-light-sysfs-emit-4b8beab74fcc

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

