Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE2C425CC1
	for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781103992; cv=none; b=TotinrVS+2Zp++BWaJQWbmyKs+QY8b20VtGeDptGpuR/BcyEYmW+vHkpWbZw6uglpeGLt3ugR7CyJeu99TPk2UrAqE052eoJXHXArYHeSG2pg2Wc/6EXnikCqBE4BTAnE08ptBSCBF4c7xLFlpPq4YUOrzmb8Ah5JqvVeGhpjVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781103992; c=relaxed/simple;
	bh=n5KY2viCF9d620hXPKRwyH3alTyKCHTYGOkodRCIfnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6QzieQ6KcgyIBvtP0oIDqROwcCersbbjX2az76yUQp4XQm3rL+JIihTtEgJaywyTwm9io79+Dtv0dJ6tlKN9EBv3b0Ssnt7eZ/sg2hdmGNZiID8qaYE2PBJSMlmW17MCEnMhgZFK7xZ3r+xhNYdc5gUwDzo8QX07yyda2JyXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TF+z2vRI; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TF+z2vRI"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9158fbaa4bbso752905285a.1
        for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781103988; x=1781708788; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhXukM9QUkGA+gfv8mb8Arvflyg1/Xv+rebhJGLwPM0=;
        b=TF+z2vRIzN08D3deESEKfOLOdXZhZ9iVC9HJtLi7jc4O1Mq+KJLkzxxf4dUNdkIqFm
         MCjCNCQy0wmKUgvDT3hNkqnDflvvtLBLYDFfbhrqEtv4vJf6BtIF3Oo0cJwG5fAoPhRP
         1UUB2PrOOaEkT/3+Ij0yQCWJRZUgG5eJMF0ucg5lAc7HAPaHaMLPEd3DdgG6VWbBqNof
         4WPyF5Fjzo1WxL37lI/NUn/xfUv/2ptfkyiBQ2L0aEo/HULvMgeZWNqOuebb3Vb2J9m4
         IATBJ3UPBw7mXbVi6/FYTY/PkLXgzSHY0Irne9u+hTkKk6tB4hGwLubHSlfCrKvEJFUK
         31Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781103988; x=1781708788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhXukM9QUkGA+gfv8mb8Arvflyg1/Xv+rebhJGLwPM0=;
        b=K8Zvbd4t5V8OaxxYO86ZsenmUPr7q7lnlATw47JgW5IbcE6zdB62QZKDIHInXiFs5d
         +IgAbA9pOmIHBGJsHM/YjylLyr4i5qkTRuAPAaw3YuCuoM2WFYHNrhlxyTZPQr+F5Q5q
         Wol016wuygD0a24uJB9sGC9qr+1L1tHl2vU6nZPO1gMZtEkCHqG+KfAPxKeY+3niL4Ez
         Q7hksLQzR9zvhdNnjIh8q/tmvTSV4d5wFmirOhI9B6IelF1gUag8nKneiZzeu4vbWB60
         rsHEyMplRtoAo+AEIc3vM4EcvKtjPlQqKPlGJoIkgquQX2+TM1kTJgZMBsjQSory4q6X
         P6mA==
X-Forwarded-Encrypted: i=1; AFNElJ+lS09/KUW9bXHlFDvuvf24mOdj3Flt7GUG+s/8XKe9Dgv9pxP8iqwGdTCRGfSD+t2Qc1YmCtrNs8JETQfV@lists.linux.dev
X-Gm-Message-State: AOJu0YyvGhzEd9AeBgg6KVKmdjp4HYWJ5N/66RCICQUiGsAy5CHnsX4X
	b3mBhjj5hqEE2l3oV0zOUm4EVItNjBSQJyxBU+cPPdLICUUw1NsTLKvV
X-Gm-Gg: Acq92OEOKzFsmJ62VoMSICoMjI8G76ZIrdn6rALP1QC32Z8ue+/M3jkCBzJeGdsPKt8
	hjjW67QQBe45o9pZ2iWKoTBWjAoLGwdJwGSd4tbV4Hujg1ciiF80R3he5DYLYoW8iKaXKhg3vZV
	lXUn6WbiQyvv2qAYuvE4IOri65Bd9JKHN/lcvoRTu8iJ2hcJBsSJp/07thq8Rx0fehLQhEj4qHq
	cgNuTLpUf3/Rjs9vXgb8Tt7IET4kGgOC9Tay8Hz9QM2ztacA9yaMGz0FLJQOokoA+ljyCxssE7e
	39muLj0QafiyCMlg8Tt8AsOqzI3m9G5uT5+w/K7TRyxEY49efOBQ03ERzTN3FRA5swLEt8RxYMm
	yx4aIJvDh6WptJlITx/psWK8kZnwj6WdFvHYncEbgbPVoNflT3tw4QOJYS2SDM/eRdZvKojEGr3
	qTmzUPxJF7a2qqA24W31jX8U4xCc9zcDa9tq1C1Pw=
X-Received: by 2002:a05:620a:2b4a:b0:912:1:b41c with SMTP id af79cd13be357-915a9a43532mr4135578285a.0.1781103987828;
        Wed, 10 Jun 2026 08:06:27 -0700 (PDT)
Received: from localhost ([43.225.189.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d2384sm2460658185a.39.2026.06.10.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:06:26 -0700 (PDT)
Date: Wed, 10 Jun 2026 18:06:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v13 17/22] media: i2c: maxim-serdes: add MAX96724 driver
Message-ID: <ail9bHXL_NV2DZK5@stanley.mountain>
References: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
 <20260604-gmsl2-3_serdes-v13-17-9d8a4919983b@analog.com>
 <20260610144242.GF2948@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610144242.GF2948@ragnatech.se>

On Wed, Jun 10, 2026 at 04:42:42PM +0200, Niklas Söderlund wrote:
> Hi,
> 
> Thanks for your work.
> 
> This patch gives me new compiler warnings, can they be avoided?
> 
>   .../max96724.c:402 max96724_log_phy_status() warn: subtract is higher precedence than shift
>   .../max96724.c:409 max96724_log_phy_status() warn: subtract is higher precedence than shift
>   .../max96724.c:588 max96724_init_phy() warn: subtract is higher precedence than shift
>   .../max96724.c:756 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
>   .../max96724.c:796 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
>   .../max96724.c:818 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
>   .../max96724.c:830 max96724_set_pipe_link() warn: subtract is higher precedence than shift
>   .../max96724.c:942 max96724_set_link_version() warn: subtract is higher precedence than shift
> 

These are Smatch warnings.  I appologize for them.  I know about them
but I haven't looked at them.  I'll fix them by the end of the week.

regards,
dan carpenter

