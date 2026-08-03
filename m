Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3458386553
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754016; cv=none; b=aJQEmx0a94rcbDOlXBrj63GcYOILBArDacA9nipLUHMMs3BDSGO6P47ktj1ShZHqYP2sLPFIOH9nhKQuBXw3n25yR8ZGxGP+EVWSv8Cbs+uLJxOxcLPIMc0sG7B+8XXNdjQu3tERNIqhgL90DqLxSLUiOKxTN8N2OYaZCosuiGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754016; c=relaxed/simple;
	bh=Glq0fmCg6xi/kYJObewGVQNCIUWZfMEBDofninoyDPc=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Subject:To:Cc:
	 References:In-Reply-To; b=NI7uKBR2O8MNqroSS8ukryPE8kE78mBOL++RrI58Mt1m1TmPC/uIdKKmgwjQ0S6RvIhk5Ubme/87XKK1uRkaa8jG6EvgDIIuT5mmhLRXQDvyDqTmN7wyGsVPIaTMj2DaatorNlXs6NYIjV2o4qCKzFc1KarOdyuZtylO8y8FOC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5Sx5C59; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5Sx5C59"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so17929455e9.0
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 03:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785754013; x=1786358813; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QTY24JB98Pe9BUSJfoHN22urBdk9I5a0mxp0X24KgE=;
        b=l5Sx5C595RYd2/430G761bcHtJk+JH8WuN/XDjxVnzHuKdWx3HgpBWsCUS8jNJW9gW
         HYMIalbJD1SZsFYpkiZBrmzFv6eHvBr/DMxsEcRpKNVZBrCkKPSkrYbV7iECc7JamXDl
         3O1PUwvcm0NQ2L7vbBzlfe5hqaQOLvOwyPIdBRfJzkBggKIuaJcxDy4vwcGev+gDcCJu
         3H7JBSTwh2NwbEo6Ro3vYq6mDr/45T5b5onKAZ7felBR33oVj8qgHxP0UUpEj/RaUA8i
         EmyemZZuESJGrAEUEM9tVm3KkdStOm3u0rFDRObZstcy3fa+NG/hy5Gyy6nbXJl8/Ms/
         qFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754013; x=1786358813;
        h=in-reply-to:references:cc:to:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QTY24JB98Pe9BUSJfoHN22urBdk9I5a0mxp0X24KgE=;
        b=h9UA0zDsTgJ+Wxq/3C7rs37xZkshtfvPE4StfumOW202hF5+imI9/fWb+0zBjMT+bz
         ruTjtXkCjjmZXIw6MAwaK5yclXUx0a+zxQkPkKaOEEAnSuKKMDfxuKQ/tsQlmdk1fD3P
         Sq8+84m7L1FtxyazVWza8ErJVp60ecNUS0HBR92YBqTm5xtoGG9v49ozu3l1HiLdLEDg
         E3Tl5yE6jx7Qg6WQJDXq+abXLPvrSigUJfzRQiu+DjKoSbVeYK0CSmwqGkPApzEsRtH+
         YsBjDgz4nLQI0SbVCmKdSDFcS1u7uJZV5qewmhRFysqlrEM9eUpzuadPkyhPdBfZEkp3
         Z8Tw==
X-Forwarded-Encrypted: i=1; AHgh+RrnidU7U/Fko8QNvg64srF5ryP6L3u1pzCyWxDY45zx0lsdymf131jkvtAgBZRtQSfzYQ2zjXNe7S3oq85j@lists.linux.dev
X-Gm-Message-State: AOJu0YxUlu4Q0J0rjDCatpAgQeqQlVel/dtdvl4lIOtye8TNHo/6hvN0
	Y2/ekSmlfiehzKT/lbXF4Gz5wDb7ElywbJDUNwPSEEIUpv+xS3t5NWbMi0/nSVVazJQ=
X-Gm-Gg: AR+sD130lGjbFeL4q8fJQflMxO0NLwEulcvx0CO/8mGSYxKyoUKtcGsYk/OvU01nN3/
	czWkcbghfHu6zQqLoHrSlXmAxfvF8Bm5lTHsDtPxNW+huh+lD2A+YaBAoVasQJ0v7GnTmX9b4Y8
	KKtGqL7xJG4O4witmMdvV71ZqmrXSivcKMfLHfOeODj5dd3bsC5LsZXvibsccZi1hJZ1n6hYy4k
	VsKLTBA2xK/e8OUxEThQYjL93x4HD1U0TGaQS38pVFH4pfoShbzDIPLA6Lely1lt41HcO2Wfy8v
	AFtV84j5b8xSbeAPpqmFCHkvzb90Ds9LPlfOg3B+spzaqEC90lHelVH3dZxB2Fqy3Wei53PNh5G
	S+fuhQe2WYC2Wm9/0/eySpOEowVMstWiQAffrJAuvG74eRaal594FNIg9At42YrUzeiu0lrHjOn
	P5I4mJZRFswBs2ZFBI68WD2XSMgSUtLjE5EWYY22XQoUlxmUHbMX4sgjPQ8Pb3zmRAEupN3xY=
X-Received: by 2002:a05:600c:d5:b0:495:6713:9a40 with SMTP id 5b1f17b1804b1-4980c6950a6mr154992895e9.18.1785754012678;
        Mon, 03 Aug 2026 03:46:52 -0700 (PDT)
Received: from localhost ([2a01:11:8f11:bb70:dddc:c199:bb35:7cb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b85be7sm269171935e9.2.2026.08.03.03.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:46:52 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 11:46:51 +0100
Message-Id: <DKF8YRNCVG1E.2F0JZKNLBEMHF@linaro.com>
Subject: Re: [PATCH v2] staging: greybus: light: fix leak of cdev->name
To: "Cong Nguyen" <congnt264@gmail.com>, "Rui Miguel Silva"
 <rmfrfs@gmail.com>, "Johan Hovold" <johan@kernel.org>, "Alex Elder"
 <elder@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <20260802060149.3803224-1-congnt264@gmail.com>
In-Reply-To: <20260802060149.3803224-1-congnt264@gmail.com>

Hi Cong,
Thanks for the patch.

On Sun Aug 2, 2026 at 7:01 AM WEST, Cong Nguyen wrote:

> gb_lights_channel_config() builds the LED classdev name with kasprintf()
> and stores it in cdev->name for every channel during the configuration
> phase, which runs before the channel is registered.
>
> That name was only released by __gb_lights_led_unregister(), i.e. only fo=
r
> a normal LED channel that was actually registered. It was therefore leake=
d
> in two cases:
>
>   - a channel that is configured but never registered, e.g.
>     channel_attr_groups_set() fails, the flash configuration fails, or a
>     later channel in the same light fails to configure and the whole ligh=
t
>     is torn down; the release path calls gb_lights_channel_unregister()
>     (which returns early because the channel is not registered) and then
>     gb_lights_channel_free();
>
>   - a flash, torch or indicator channel, whose unregister path
>     (__gb_lights_flash_led_unregister()) never releases cdev->name at all=
,
>     so the name leaks even on a successful teardown.
>
> cdev->name is a configuration-phase allocation, like channel->color_name
> and channel->mode_name. Free it in gb_lights_channel_free() next to
> those, since that runs unconditionally on every teardown path, and drop
> the special case free from __gb_lights_led_unregister().
> gb_lights_channel_unregister() is only ever called from
> gb_lights_channel_release(), immediately followed by
> gb_lights_channel_free(), so the name is still released on the registered
> path and is freed exactly once.
>
> Commit 04820da21050 ("staging: greybus: light: Release memory obtained by
> kasprintf") fixed the leak for the registered normal-LED path only; this
> covers the remaining cases.
>
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Good Catch, LGTM.
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    RUi
> ---
> Changes in v2:
> - Add Assisted-by: tag to document AI assistance, per
>   Documentation/process/coding-assistants.rst (Greg KH).
> - No functional change.
>
>  drivers/staging/greybus/light.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/li=
ght.c
> index cab02b5da867..1ecca479b5f4 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -905,8 +905,6 @@ static void __gb_lights_led_unregister(struct gb_chan=
nel *channel)
>  		return;
> =20
>  	led_classdev_unregister(cdev);
> -	kfree(cdev->name);
> -	cdev->name =3D NULL;
>  	channel->led =3D NULL;
>  }
> =20
> @@ -1063,6 +1061,9 @@ static int gb_lights_light_register(struct gb_light=
 *light)
> =20
>  static void gb_lights_channel_free(struct gb_channel *channel)
>  {
> +	struct led_classdev *cdev =3D get_channel_cdev(channel);
> +
> +	kfree(cdev->name);
>  	kfree(channel->attrs);
>  	kfree(channel->attr_group);
>  	kfree(channel->attr_groups);
> --=20
> 2.25.1



