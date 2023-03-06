Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C2C7E
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 09:25:50 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id s11so35634632edy.8
        for <linux-staging@lists.linux.dev>; Mon, 06 Mar 2023 01:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678094749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=19sAxqtflWHF9arRFQZiDCDY+sSsYy5IgiKXozUvNWc=;
        b=XAIFhtFfalfv1jt06PcK0s9tK/uMkZAGx4NWp7SYVtqiEqup+UCgEooIrvZqj+aR/d
         NsEoErqlgzQj2XvTNVjmGv4Tx0lHn6Eq8fUpOIEWr5x4csPmSEXk/984Cx7X7htmsTtK
         ttDVJRkxup9bN15qciDmktmnPyquzhmRLf5m/WrtQpMsQpPxmqDe5w11gQksPQ0NH4Wg
         /SDJWEk2fd3jOkn1YqLShMM2Vv/BVCNIgYHfE0BMooQ2ADvcabzBxrHtV54jBfjYEfZ9
         NM2kUzIGAwvDGOJF6Bjenu/AyZFOn39F+Kfj0luELZRnrvxXykM6MvtZ9x1BfbTED+MH
         nKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19sAxqtflWHF9arRFQZiDCDY+sSsYy5IgiKXozUvNWc=;
        b=rJuoRNHlmjSPsB7HNz8vx7lXumnG6BDFu2GpHwxUZfX80da+QlOKjREyrO4W+qOJ1l
         2gkRG+CfBOthaQcDD1gd6s9Su5Kdcz3CmY9ugvKLflAoCIDIYllV2ZyVT9j1nYROUHht
         YR4G9Qv7NnkZdg+IycAGGmZAZM3FeMOBlvWK17DxjuqoxkMFPdEiZpoVMHb/MHQyN4Ma
         vwYkEXDecKiXi7Re/0n6NQVMoT8oe3l8zDGG9HzANqsvm4qRViFUz304XmGjhJc0UqWU
         tNpR3pqvtmD5XgNDRH2qAOHia5zOLsmmcj/lWY7/UpyQ+q1aFTm0WjvJ6UWm+NxBGDpv
         XS8A==
X-Gm-Message-State: AO0yUKXzVhEbceS9NsnK+TXUKxfVudXaRevPsk4DaQoRxN7PnN56ooGG
	kJulbrAAq7jK8INscrQWTeo=
X-Google-Smtp-Source: AK7set/2xm/zHA8DT11sDQEJOZHax5hrf8EJTQmQrbtjfC05auLqsv4AzV4RXixlSzy04ghd2KUdxA==
X-Received: by 2002:a17:907:1b1e:b0:8b2:8876:2a11 with SMTP id mp30-20020a1709071b1e00b008b288762a11mr14630779ejc.28.1678094748846;
        Mon, 06 Mar 2023 01:25:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bo19-20020a170906d05300b008cae50b0115sm4277958ejb.87.2023.03.06.01.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:25:48 -0800 (PST)
Date: Mon, 6 Mar 2023 12:25:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8192e: Remove empty Array
 Rtl8192PciEPHY_REGArray
Message-ID: <7d3eaf69-8ddb-4b63-ae8c-89b6a34e9493@kili.mountain>
References: <cover.1677955334.git.philipp.g.hortmann@gmail.com>
 <511bd239bf033dca3efcc64a640d5343c98fa897.1677955334.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <511bd239bf033dca3efcc64a640d5343c98fa897.1677955334.git.philipp.g.hortmann@gmail.com>

On Sat, Mar 04, 2023 at 08:13:22PM +0100, Philipp Hortmann wrote:
> Remove empty array Rtl8192PciEPHY_REGArray and the code where it is used
> because it is dead code.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 5 +----
>  drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 2 --
>  drivers/staging/rtl8192e/rtl8192e/table.c      | 2 --
>  drivers/staging/rtl8192e/rtl8192e/table.h      | 2 --

What are these table.[ch] files?  I don't seem to have them.

regards,
dan carpenter

