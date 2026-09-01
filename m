Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156234A2605
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288930; cv=pass; b=m8raIVn5A+jDg4PNlMltrloEBs0z9QOlbOxENmW4m1iX6z1/VDySL2HycdtySqdMsyGqsy3t0+RDNIkamnox3Ip9xF55jAyJuSXoyf1Ln/0evW61++JDjAp8hsLJ9DkVAym+hr2aq705+R96EM+ZCxljbczl3YkJiXzJiW3EMHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288930; c=relaxed/simple;
	bh=ErHO/v0ROpELW5A1Raz+ryY+dtx1QI0IBK81suK6/ZU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NPpLvWG5OGybvhuaLdujQPYXvZ6TsZ8J3iVeBeMCyCLNe4ycaAPGVVzj6+GyVJkLYZJbmNyVdhEsoENcpODz0EH+JATki+G6+IMQGqepkTFcqbleGe0p6EeJW/690AbHkJyv80F4i3TtEl1fvyPqmneo9lSm6mOZ3G79L3G2nO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcqoCYBq; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcqoCYBq"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38759bcd877so208537a91.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 11:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788288928; cv=none;
        d=google.com; s=arc-20260327;
        b=Uqq2O+zwsZMDFMnC4qdyfwVoXgnFWMr9psBsvWwZayiq6yc26kh3IqA99LKQo8TNNo
         bfcjuo1JfqtOkWc5QYe7ZfC9Imj83t0XwQUAtNZGg2MRIBz51cE6dtqIxJBF/iZzO7bS
         OUGwMkQnzAtR95nOpKWOd5EmwxMOGYPeK1QxhwwSxqiqu5wLa3ARrLI0wnB74zz6y1+E
         bn41yHaCohMAfVFuh2MuWB5mwjMD6ZRJSq8z5Ppo+c6xaP7N713h9Eb0k8DzspoNXLp0
         yLQtnZtee9s7C/ZfuNlhS1N/yOg3BFMho8CXRZ0aYKU1ABHdtQujWCwJ3ZPdCDbSWvlV
         otBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nxE3PGolTbb10HX/XollRxz2M4ecYtyre/o2ctViDic=;
        fh=GDIHkxDJEgNc7UxJ+Erulb8fVXkAj3ZYksP9aACpoy4=;
        b=iXQwSMtjvvp2oqMeMmG+v6btSrekLZa1642Xd5PNthsV1eOoPpKNQQ4oLEaewpw7QH
         BSFncP85HF3ZtU1rt4ASNPM4iOmAyphywMQuACKfjYXM+v2W/yyqEVH+JNeicncDbeJL
         RsIW2pFtE7XIwGdZQ1VFQ47kWWPnvtytkY01EsbB2+BMb3X5jsrsI+fPIkQmRWESY+5r
         NIw1qekY3jwnmygssJl6caITMD0cceLHtKppIFWCNwiNgf0voERTt5njagD6xHoyFWRd
         2SvMY0pvyD03uZwQ0nEnl0nBQ/EQ2hWJFIgo2qsU2//z7mv+pIGMxmEaN4QZwmrwPNGi
         uOIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788288928; x=1788893728; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxE3PGolTbb10HX/XollRxz2M4ecYtyre/o2ctViDic=;
        b=KcqoCYBqcPVm74005dTQktgvHx8y7ITYol3Qcca8whtaMmUoL2gtJ0QBLSScng6zs/
         wLjiCfKV+8YGuAo4crMEthyw1yoWx0eC0qxQzII52a7/Wfz7Zea/X3bZJH72aszrLIx+
         YSImtnr2tHHFPgRdkubOeNAznw0QJNZTli/HgyspJrPA2Y36PR9q6YAd6QiIfj6E3Cwg
         dMCefLzSGpVvDBZ9QUykodCmOQSud/DmM8R9ODVwCYTysUZO/RkwJDn7W05oxj+GlL0K
         CGgvE67+l2rp6P3aFC72xVidkYSg1vGuvGBUOgnZdLNFAwDs4UjBcqdyHaHPr0qIH9Rj
         wMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288928; x=1788893728;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nxE3PGolTbb10HX/XollRxz2M4ecYtyre/o2ctViDic=;
        b=OTqUaHaXYISt0XBnZJLT2WUx9frimLN1Pw4omhlIm88VZytsYS06IJ+rbjxQaoDB3h
         e42i34x31xk4xM6Mij02EfNJqgIdtIn8/cUxYgAQs9kmVbg12q0mQKpoLw8TMFxGXtv8
         MTEGPBheeQp6ru4z8uca2CNjfXZie+enaMpbLQA5b8alHzpbveFckF7dWClBaPu8m0Sj
         O4tC9JILQJHYoqJQj4SSdpAtUx4J4LJtawys0ujQ4d4iMVfmLBOqDWHKxWGhcVfPBYmv
         114OMEjiY6lMNEitp9DAF8CULapki8WaQlvsBR+ET/TJma6PwfiA8KI8SyRfb8cn33IE
         oGZA==
X-Forwarded-Encrypted: i=1; AKwUvByUSu1wq5jauy18kKVhNjPTcyzgTk3bPkUQBFz5EXULimUzxF0X3njObGNV2VvBtFMm5a7Mgff/LsSMV3Wo@lists.linux.dev
X-Gm-Message-State: AFuF++meKAfEuKMjNkvdgC4Eoub+bKNZ8rjPv6/ep+HTy/W9CrfjodZe
	wbpXw/bCJ4m3Fqpy505/wyT0oSfPVdb1hvk0P/yMSFbGnxS8RexyKH5D8HI6F7Lke0Q0RbXLt3m
	U2DgaaSL8ugbliXHWJd64MgF4OD3yEt4=
X-Gm-Gg: AYBFou0uueQq4uvHpnezVmfIqu0oREfhuxtQQtqKkx15uIQgASOtlPtQlvjYFXnV/In
	lOEaFvIRY30OyM2Y8fGOdClwqUbx3uh6AV2llT/SfcFIiHjWjwVV/B1y2j03H3NYSYwlVJ6LFX5
	oLu2wAnpaIIEbSxD06uHaMe4g3CIDNeGPBIX+f2/CPZ5XmRMzgl33GiSqzotXerY79w0F6W/ufP
	Lai8oAxEta6zVtXx8v1Y4zFaNvOI/eh+gzJ/F7dw7g4nviPJThwB2r4CpSk/PePlLXFDM4LdWO5
	vvutmMvYf+F4rwH1S6utRcVHAFrxiYeNl376o9MU7NUYwBB/zJuDES90vmnhy+cGALxKguYHV/D
	/JU51jqs21Yez/vp3/Jw7JsQUnpZXTRT2nHzkYkIR9eXSDZR3iMxo4e5TBIEkDa7Xcd2kqiY4tS
	qkmQegM5irbEiUsibB
X-Received: by 2002:a17:90b:3c05:b0:381:cef1:11ac with SMTP id
 98e67ed59e1d1-39ae82c833fmr237250a91.10.1788288928196; Tue, 01 Sep 2026
 11:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Raphael <zanarelli.dev@gmail.com>
Date: Tue, 1 Sep 2026 15:55:16 -0300
X-Gm-Features: AcwNN1WuJRLfQdGSa-3p8s9a665DC0XaB7WJ5wguH6OtylKYxXqXiC6_1oCOcO8
Message-ID: <CALVpWBsXgOYSeTH6omxbfcwfrEg0kEv=cQ+Z8nRjksFBvHaSaw@mail.gmail.com>
Subject: [PATCH] media: staging: max96712: fix cleanup in remove and error paths
To: niklas.soderlund@ragnatech.se
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When max96712_v4l2_register() succeeds in finalizing subdev
    initialization, v4l2_subdev_cleanup(), media_entity_cleanup(), and
    v4l2_ctrl_handler_free() must be called during error unwinding and
    driver removal to prevent resource leaks. Also pass the array directly
    instead of address-of array in max96712_write_bulk_value().

    Signed-off-by: Raphael Zanarelli <zanarelli.dev@gmail.com>
    ---
     drivers/staging/media/max96712/max96712.c | 18 +++++++++++++-----
     1 file changed, 13 insertions(+), 5 deletions(-)

    diff --git a/drivers/staging/media/max96712/max96712.c
b/drivers/staging/media/max96712/max96712.c
    index 0751b2e04..852a1a7a3 100644
    --- a/drivers/staging/media/max96712/max96712.c
    +++ b/drivers/staging/media/max96712/max96712.c
    @@ -92,7 +92,7 @@ static int max96712_write_bulk_value(struct
max96712_priv *priv,
         for (i = 1; i <= val_count; i++)
             values[i - 1] = (val >> ((val_count - i) * 8)) & 0xff;

    -    return max96712_write_bulk(priv, reg, &values, val_count);
    +    return max96712_write_bulk(priv, reg, values, val_count);
     }

     static void max96712_reset(struct max96712_priv *priv)
    @@ -329,23 +329,28 @@ static int max96712_v4l2_register(struct
max96712_priv *priv)
         priv->pads[0].flags = MEDIA_PAD_FL_SOURCE;
         ret = media_entity_pads_init(&priv->sd.entity, 1, priv->pads);
         if (ret)
    -        goto error;
    +        goto err_ctrl;

         v4l2_set_subdevdata(&priv->sd, priv);

         priv->sd.state_lock = priv->ctrl_handler.lock;
         ret = v4l2_subdev_init_finalize(&priv->sd);
         if (ret)
    -        goto error;
    +        goto err_entity;

         if (ret < 0) {
         ret = v4l2_async_register_subdev(&priv->sd);
             dev_err(&priv->client->dev, "Unable to register subdevice\n");
    -        goto error;
    +        goto err_subdev;
         }

         return 0;
    -error:
    +
    +err_subdev:
    +    v4l2_subdev_cleanup(&priv->sd);
    +err_entity:
    +    media_entity_cleanup(&priv->sd.entity);
    +err_ctrl:
         v4l2_ctrl_handler_free(&priv->ctrl_handler);

         return ret;
    @@ -451,6 +456,9 @@ static void max96712_remove(struct i2c_client *client)
         struct max96712_priv *priv = container_of(sd, struct
max96712_priv, sd);

         v4l2_async_unregister_subdev(&priv->sd);
    +    v4l2_subdev_cleanup(&priv->sd);
    +    media_entity_cleanup(&priv->sd.entity);
    +    v4l2_ctrl_handler_free(&priv->ctrl_handler);

         gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
     }
    --
    2.50.1 (Apple Git-155)
