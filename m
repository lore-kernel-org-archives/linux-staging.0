Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC768341076
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 16:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135549; cv=pass; b=iGClTHUC6vGOrRNPwmHI3F67lj8PK46Hc9FUVBmDcK8wywClAQn487jkT+TF8GIj3zWVRcSXlQBmqQGca6Lm1EnkngsAMWxbWrmCF8idEhJdHvIC3tMSpnLnmgLVkgVHZ2dGirJsSSJuP9CltmQJGma5vlvLkXmsXFBNQmFltQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135549; c=relaxed/simple;
	bh=3Or9qnmZXb/YtOKPUKO1itpOT92COLmWi3FvTW+xSNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=JOzmTZNf7XHUdKuqQvgQcXIdXlM5C+qjc6ngjnQgYERq49iSrMCQV8K54/6k3PgNotmWADvauipRHljqZnbkzHEu5FIw/i7VZn7S3GjxyTudoTmrq7r7HozeIS6uQ5l2z0/L/di3KPLPLDPRtwFj47cDARm+0upfSIFexQfTWzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVOv7+Pq; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVOv7+Pq"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4096aab5521so4011586fac.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 08:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770135547; cv=none;
        d=google.com; s=arc-20240605;
        b=f2WcseI/C/or4A18BmG+hOTnHunEvtXMART1F0WpJCVDDCJloOFwHqxs/qOvt6Vgop
         n6gpSuN6TnreIFypgaCZbI+hjX3QbSBLHyqUYSf7NnqCo/zYWKNSl0IF4lrRIhjU1d7r
         9hhzTDCWIBBve+Odt3Hq9K2AMdzlqv0pwSYlYoj+qBv2vpElpHUSwRjw87e/gx0CN0YS
         lhPMvgXTzTDO4JdgR+tMnRnMX3/ZJ//0uD/sETBZBEqkcLGOTJcqFtPZ9OQWtjVePgQc
         ncmMVSeBDxM7i2s60DNNL4+QOzEaa7ixvucnqT5uFfXSty8kGEPr6SOu54Cmuh6mnrWr
         HRJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NWWbEbxK1poqIotDvk6UrXputXw4PUznJR4lzGaxAy0=;
        fh=/ejaCOFeMHa6hpcFQfu52zISIuUKpD5Uj2AUdpdO1y4=;
        b=XbIF88H38lwFonqtcW03oZ2rHtrisgv1pOJBF26cGx057DPonplQogczsZZKiIjP95
         02a0O8U4mxwHw4PJJS+gyuKNJnubRAmCcaNt9AQVsXUg357UnM0R8I13Cj/8vSqKtaan
         5yEelTLvXMgApftZVzQa1+csVFIGh20SL/PqIw3iy+RH7FYWiCZudYEEtcpz1gzWn/rZ
         G3XcxU/QJCJA+OI2J39xruv77omtnnX47yW/W4Z6Gr4q0H7Lx5+GEdi/uJKec11DCjX7
         CU6/LxuZl68sAc1NiS0+EAnX9CD7Wya/Ez7hvqPxOwC1S0wTIwvvPKbx6fbx06cMQqSg
         b9rQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770135547; x=1770740347; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWWbEbxK1poqIotDvk6UrXputXw4PUznJR4lzGaxAy0=;
        b=DVOv7+Pqnm2HhimiQrYeVQ4blIQR5HMCS8qgDY3/mp1g7+seZcjl8kzvvXvyQaf5Z4
         byqDlPfEmHGIySaAoHVuqCvJVBIr8Rq1zW64QE/Y+KWFCxypdOCIvTHxCLMaWBmdflmJ
         4+U3gobsIC1FvUTYUccDRWQpj/+frBsqu43qJtN7B1eWD6khn3riXj8QNEBQpip6Ycr/
         19BEq3oKmdlaTc6J+YBhfAvzTPLecy8DItVPgus+3ZCAA8sinr3o1BG/eYzjFbe8X49M
         KIlyGSQL4og0S2nlhHPQAmOIkLdJoeEBdqqeWYnnafXGYM5/LDsFqRxRacapxJqzec2f
         x1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135547; x=1770740347;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWWbEbxK1poqIotDvk6UrXputXw4PUznJR4lzGaxAy0=;
        b=nAHwMt9AlU4RjTbAkYFeNp1w9Kpyah8CtrOO3q9BoUD+uljkzQslxpJ2Xihhj/hIFA
         PIsL6EuSd4c1IUvF6NFKv8tGrphcS9DjvvTWBckxIQ3vIXKMzdcBjP8H2Kd48evylZJ/
         Ndff8LO3uCAKwEcFo49BUmf+634fKDaG/SMQRvB5WZEVXQ4UBwbnX4kzGX9XDHR+2Qlx
         Rq629CY0BInWigPEoY/BTEnrhmsf+5vp4DrftAIdmJ/EHGfYR/AtlUeXyfth4AKNa3NI
         Xao8SHq4Zhpx2EfI4sz/+kQa4m2OqN/YShvV9ugUFzU9HpSlDZf7PWmfliuv3xHb37Cx
         6G5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUQ7YJwCaq9sjISEEuMlvsy1UJLBtpvxro4wxo5ZkHL9FFBuyrZQmhqPCBepsyM9f1ARGa+NYm4Zx1oDII@lists.linux.dev
X-Gm-Message-State: AOJu0YyWfZumRxmKeWuNXZGg8m7jIO9QDfydhwLlSK6WOaqrxjkdpaBN
	WIhiw6jZk9hkOVNrOIpNU8D+1Tju8+VyhVZsLzhTA6Iqh3++yuIzG7hGpU6UD2A+Ujy2CDQE8y8
	GkcE40omUu4oudDvduua2kgAvQVTxWaWQsF4R
X-Gm-Gg: AZuq6aIJfcFLPvlZUUjtliR5r6PQTVduEfPk6eukpaWb8ybVUpG7HOpULQF4ERTyH7n
	8WkPhN2dYeRdryXePCHF7XQ806/BZ58QwhYcNNqTylBL2LKTVzp9150vq1mr5IdcW0+A7V2DzdV
	ilxq9UIZw+4EQ/FzEkvw7NdUkLf9IEmqHNtl4Zk7Cy3fM94fYX2NzFz4CziJhz6wil9y1f6qxx8
	7AGSAbbjfignjerj/NS3LMAt2cYbcSxdOLsP46ivlEGOo+P8RkAzL5cP+rWYn+o5Qj5JCqO4LHP
	zFsfnm5hNt1fv2Fs7SMpbH21YBGQ/4uGln1h/qg=
X-Received: by 2002:a05:6820:1c88:b0:663:1239:9eaf with SMTP id
 006d021491bc7-66a20e5a319mr84826eaf.31.1770135546839; Tue, 03 Feb 2026
 08:19:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203123209.182175-1-rchtdhr@gmail.com> <20260203123209.182175-2-rchtdhr@gmail.com>
In-Reply-To: <20260203123209.182175-2-rchtdhr@gmail.com>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, 3 Feb 2026 21:48:54 +0530
X-Gm-Features: AZwV_QgVtz3x-9U5iW7yjuquQo8zExZHQ0k8bTICKHm7ezSp1cGJ-zO-8pgnZas
Message-ID: <CAJH1ELDk=XGwisqZMS5Y7cMHMRGZqRGKveHYfLqJsXGTwNL_HQ@mail.gmail.com>
Subject: Fwd: [PATCH v2 2/4] staging: greybus: fixed styling issue in fw-management.c
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, Feb 3, 2026 at 6:02=E2=80=AFPM
Subject: [PATCH v2 2/4] staging: greybus: fixed styling issue in fw-managem=
ent.c
To:
Cc: Rachit Dhar <rchtdhr@gmail.com>, Viresh Kumar
<vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder
<elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Fixed a styling issue highlighted by checkpatch.pl.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c
b/drivers/staging/greybus/fw-management.c
index 07a0e6b63cf3..cf917ddb79c4 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt,
unsigned int cmd,
                        return -EFAULT;

                ret =3D fw_mgmt_load_and_validate_operation(fw_mgmt,
-                               intf_load.load_method, intf_load.firmware_t=
ag);
+                                                         intf_load.load_me=
thod,
+
intf_load.firmware_tag);
                if (ret)
                        return ret;

--
2.43.0
