Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0FB1C01
	for <linux-staging@lists.linux.dev>; Thu, 20 Jul 2023 05:37:10 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31297125334so240606f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 19 Jul 2023 22:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689831428; x=1690436228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=prBKU4P9K5Vnrw3K61gdTnAtHxfWsqw2YOPhkHzhRo8=;
        b=MTKdFpWrOPbvoqRrtB2WF6CuCvdPunNmcaInrU+iSi57NGxkFN+xLVroy51LpmAlEu
         cFgZbWX70EMqbH2bPZgJnnpctD6jtNrDMuEJkJ/tkKcvA5wKICX2gFsJP9cVtTsufQid
         mm+rdjcHVMDsKZ6rvG201LjEXr+caApYg9xmOlScNf2AmBMmPWxC1v7N1xwT3ZAA51zk
         qxsz1pCv9+FSY7CxlgFOaKUrvKrjKfXfSbXRWQaemW5wCnS6+YqzETU1WqLMM3KUYbO1
         Tj9wLn1MS8NEHlKnYTnMt1X4Nmhlr2xUgwYcPasMbal8cy7Q54S54YyuuzbKRUF9jhA2
         ss8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689831428; x=1690436228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prBKU4P9K5Vnrw3K61gdTnAtHxfWsqw2YOPhkHzhRo8=;
        b=M+fo0Jgcg2lMN6Y8lKKNbbQYyaEJCqY0DjNl+d2D2bIAPOs6h/t1IObpPCjG0pDJWk
         Gc5HA+8QYSJQQCzXNrJcvzca/vfkP7vWQtFgCJ4PEboOqFlhvv2VI0Sw342/ZytNAjVT
         CKiIVh1TMT2+9h18OyJx/QjMXPpgCeRN8dkxl8qO+F/s8qLsQ/id+g+OYbw0qGEsKJA/
         0oiF0/mqZe45pr+7OZ3IPCbTHkCpP/ZmX0BewR7AWOWWCvy1PFvTIeZwB1qQnI+NBJNE
         Wa7Cervl8Cdv+G11/9WkJ5AcE6uAGJ1ICavg+PcNL/JoAL936wlfQmjO/7BdfYSwu/67
         ry7w==
X-Gm-Message-State: ABy/qLaZNJ0RKzwkm1dGq+i3eNS76/l277Lvaj/cqlg++sbvIpFmI/jd
	NP8OX0GqNYT8q3WZ4Dvzl3XyAw==
X-Google-Smtp-Source: APBJJlHeGcYPzHF6itqem5hwKM5eAFLK2SDkFj5Zv+rK8xwF3m3obxBYz6B74SB3B9T8n9YD++ZDjg==
X-Received: by 2002:a5d:62d1:0:b0:313:f75b:c552 with SMTP id o17-20020a5d62d1000000b00313f75bc552mr1533061wrv.15.1689831428389;
        Wed, 19 Jul 2023 22:37:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d58e6000000b00313f9085119sm149792wrd.113.2023.07.19.22.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 22:37:06 -0700 (PDT)
Date: Thu, 20 Jul 2023 08:37:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stefan.wahren@i2se.com,
	gregkh@linuxfoundation.org, f.fainelli@gmail.com,
	athierry@redhat.com, error27@gmail.com,
	dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v9 2/5] staging: vc04_services: vchiq_arm: Register
 vchiq_bus_type
Message-ID: <8cd787ae-85ae-4187-9009-d3596b120186@kadam.mountain>
References: <20230719164427.1383646-1-umang.jain@ideasonboard.com>
 <20230719164427.1383646-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719164427.1383646-3-umang.jain@ideasonboard.com>

On Wed, Jul 19, 2023 at 10:14:24PM +0530, Umang Jain wrote:
> @@ -1870,6 +1872,12 @@ static int __init vchiq_driver_init(void)
>  {
>  	int ret;
>  
> +	ret = bus_register(&vchiq_bus_type);
> +	if (ret) {
> +		pr_err("Failed to register %s\n", vchiq_bus_type.name);
> +		return ret;
> +	}
> +
>  	ret = platform_driver_register(&vchiq_driver);
>  	if (ret)
>  		pr_err("Failed to register vchiq driver\n");

Call bus_unregister() if platform_driver_register() fails.  Otherwise
it probably leads to a use after free or something bad.

> @@ -1880,6 +1888,7 @@ module_init(vchiq_driver_init);

regards,
dan carpenter

