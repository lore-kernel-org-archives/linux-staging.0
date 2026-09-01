Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F98143933A
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 03:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231706; cv=none; b=fk2+E6NLmljoBZvSYYqaB2QVY5NOyIaXs5hbwsH3EQmV0iWOxTFx+HN1jonZWASvAFR0+cxg3ItIkd+nV7fJ6azmPaQGdgu8y23v9QHlZkPqAkeE/8vBHbHEw0MrCeo6l5qtbdbBHJRXwGfeyhDwlr8nW947eS8MmZAEFZstcc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231706; c=relaxed/simple;
	bh=Hkef5vm62/D8cTKYlAkrlWuX7kZwXD/Ej6YpAUBO93g=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=HbkycB54DGHPgFVjywNjj86rVbGNJqo6fk7cdTDv63kwMz6V8HuqYIAxcXsKveU5i9gsL7+V9z3xfaybjHboJQj5Z0wLKexzso2cCPHN3eijB3ojwpdWXYvEo6UJI5m9IVxZ0hFut9f+PtDRr4h1HlU/dkoXYXffED9o4a0voLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFlFCOyx; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFlFCOyx"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398a5aad413so427375a91.3
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 20:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788231702; x=1788836502; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyGWHCwFIJqwX2o4/R+Ah8t50K3KPyd4i+kW0IOiB4I=;
        b=kFlFCOyxrEDX797ByEKWV3LIcYZ0Jebpk51gFCYJobnCYiPH8jhFon2vMnO3+nk+z+
         RpxbqwoHj8lSvssHaFjTS37n70W1xj/7/W5vUfDUFMwBtvGMj6nr/vGcsForU7rVMsvg
         8FE09ySvCqBPP61yNn3l8aRNzVT7wZjr3yVwYOptLNVkx+qX3a+M8nnZGKvxRv/+5kwQ
         Njnr1659Vc60yofHR9df6UqlAMhxfNIdFG3yAsWUFKRsKPPBMLH2fbGPAc+LGNkF9LX2
         2uYTm6efypLcTJJqaDMfZtgQDBAl0sSAfdzznrc5ufh/iq7ge2t8FGeZ27Vp0ef+8z6R
         cU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231702; x=1788836502;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tyGWHCwFIJqwX2o4/R+Ah8t50K3KPyd4i+kW0IOiB4I=;
        b=I0pxUy+B4m0UI1wJkWL/H874fvxbiG2kGGmcSDHIb4AN05oW+fvV7XQB78UsTQB3gb
         bJpUB5YdIJOlUZvcMAr+JmoVMsrLGRyD35Yv/u/wJGivrFC9ZWBbEaqOURj3deORD8RB
         sbcKTxYlDzjmFzWGKDaOPxksJKpYoRv6vrPwzOrDsbSHHgkCrzA579GMhUlEWgD3MuB5
         bWeCchbpo+9qfFERXJ0mUk5A1Zhxjx7EJr/9+4P9bKRrPTmZ/1FfY3YwI72arGlDZQLN
         /Zmjppx4iFk5Z/FUVbj3qfe3KxCrmlO6FAZ4PjStyFU+h9uLKDaCgafazye2ZWpmqE+5
         JOwg==
X-Gm-Message-State: AFuF++l1HEhyXcl2z2CmJ6IQQdIyUNyP3XdJl70K6b0p9U7ZwBqiXQmA
	6DFXk1nPXZ3nvvBSa6d7V4/Zlpun9kUNbqxWSU5o9ymWvtX+73GOyVQT
X-Gm-Gg: AYBFou27pr5MpZfQn/7b8k335Ou2EJh5il1MgbUVEHrh+E86CulD2BrDMuKTXL2kQx2
	NIRs9BLRjeJ6C+/JtmbmZ8FsvfNN3zV1iXue1nMHJdt4ld8+VHxQnW/fMIWS85R/YlIcc9ZxZSd
	2YkQKAT9f0kcyTiLapro1T/qSkeeYMF8nasX4tDxuQnE6AjwhT8bhuqe1z4HcOySUBte23iDsV0
	Y64FKc3essasDy6tBRuDbcUWzgcIYrxiiogIyDcww71/RaYNPuT75gB0CVp78A7WnPWi1aOM8IT
	CUGjfg7aNexCVA5KOajpKNpQMquOAryZhh2rYJ7uGPkbcZ7X0RVnU4RfItYSteXGLDGErs+iiEk
	fg0THeb/PxIRct/Zb3OPP3X9hW9GrYS9jCAsbFstKYiz0YCiNw+VKUDBQ2oQVwqQY5Fqi7EkPNp
	a/ljuDnwe+AGb0cx79/EiC4MQmoF5j81VHe//S0s349XBA83yLrp2lvSIz8UzY9tt2lxnY6g/0W
	D9cXkwM1q6b6O9lI4ORofZq+KTMwH+kSoWNWWJS9fPDzZl86eHlZTUSaQ==
X-Received: by 2002:a17:90b:3c07:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-398c0ad98afmr24074334a91.15.1788231701893;
        Mon, 31 Aug 2026 20:01:41 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:f149:be84:942d:9300])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0e0e67dsm30150628c88.15.2026.08.31.20.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:01:41 -0700 (PDT)
Message-ID: <6a964015.7d702ed2.1273e8.5ac0@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: 1 Sep 2026 08:31:41 +0530
Subject: [PATCH] staging: axis-fifo: fix underflow of tx_fifo_depth in size
 check
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

axis_fifo_write() bounds a transmit by checking:=0D=0A=0D=0A    w=
ords_to_write > (fifo->tx_fifo_depth - 4)=0D=0A=0D=0Afifo->tx_fif=
o_depth is an unsigned int populated directly from the=0D=0Adevic=
etree property "xlnx,tx-fifo-depth" in axis_fifo_parse_dt(),=0D=0A=
with no lower-bound validation. If a devicetree ever supplies a=0D=0A=
tx-fifo-depth smaller than 4 (e.g. a malformed or misconfigured D=
T),=0D=0A"tx_fifo_depth - 4" underflows, wrapping to a huge value=
. The size=0D=0Acheck above then never triggers, silently defeati=
ng the exact=0D=0Aoverrun protection the surrounding comment desc=
ribes: writes far=0D=0Alarger than the FIFO's real capacity get a=
ccepted and passed to the=0D=0Ahardware, driving it into the "Tra=
nsmit Packet Overrun Error"=0D=0Acondition the check exists to pr=
event.=0D=0A=0D=0AValidate tx_fifo_depth against the minimum the =
driver requires at=0D=0Adevicetree-parse time, matching the exist=
ing validation style already=0D=0Aused in axis_fifo_parse_dt() fo=
r the other DT properties.=0D=0A=0D=0ASigned-off-by: Manush Prajw=
al <manushprajwal555@gmail.com>=0D=0A---=0D=0A drivers/staging/ax=
is-fifo/axis-fifo.c | 7 +++++++=0D=0A 1 file changed, 7 insertion=
s(+)=0D=0A=0D=0Adiff --git a/drivers/staging/axis-fifo/axis-fifo.=
c b/drivers/staging/axis-fifo/axis-fifo.c=0D=0Aindex 3d358f919352=
3c..dba76fbf5d685a 100644=0D=0A--- a/drivers/staging/axis-fifo/ax=
is-fifo.c=0D=0A+++ b/drivers/staging/axis-fifo/axis-fifo.c=0D=0A@=
@ -412,6 +412,13 @@ static int axis_fifo_parse_dt(struct axis_fif=
o *fifo)=0D=0A 				   &fifo->tx_fifo_depth);=0D=0A 	if (ret)=0D=0A=
 		return ret;=0D=0A+	/*=0D=0A+	 * axis_fifo_write() computes 'tx=
_fifo_depth - 4' to bound the size of=0D=0A+	 * a transmit; a dep=
th smaller than that underflows the unsigned=0D=0A+	 * subtractio=
n and silently disables the overrun check.=0D=0A+	 */=0D=0A+	if (=
fifo->tx_fifo_depth < 4)=0D=0A+		return -EINVAL;=0D=0A =0D=0A 	re=
t =3D of_property_read_u32(node, "xlnx,use-rx-data",=0D=0A 				  =
 &fifo->has_rx_fifo);=0D=0A--=0D=0A2.43.0

