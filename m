Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6397B
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 07:58:38 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id j2so14443187wrh.9
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 23:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678262316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftAkY/HAGWtPCN42i8FnBrPED03jDD/hiuSkO/UJIE8=;
        b=EnB3/ts3oG7afKJNMAGj9b0Rj3KVKl/ymfjBm1l2KtLvnEiMUTFeRfmWDKTkguMqIm
         B4sKebVI0QwfaYwm4TV/kGzgbxLNlCaP65LZunLkt+ZgI+XZkwyItnCAlmpOaNoLFiD5
         icu/aaw60mX4QJHCbMbfp+16z8jD/myfbeQjuUylRwcXEHwTBDcSmxTuamTL83W1qNLu
         Xw0gc7aYX+tzBPl7QPM7Wv0yZH3ieMK+wke2V16w0tgKex0RpPRXx+cuEgFEN7Q4q1Pe
         X1K18nNHMaRGbqp8AsyCjy8utjvjv0Wv8jvGMsjoQdMKBsz4M719GiKxCvRy/4MLV8wG
         p11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678262316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftAkY/HAGWtPCN42i8FnBrPED03jDD/hiuSkO/UJIE8=;
        b=JcqpcH4DDFoPlR6xSGypZRy/wa+nzEtcVlhBWDpuyRbkNBW5WkBfXxwitufQnb/QqY
         CN1dE0u94YiKnOz/Di+xkJbQFkDwmaFDnP9hmOle3liotUc8HYvqDOtJFtnBM9rdiUq6
         AeEgnA6PZ487YWzKybFsTgPssyJ73d0+DeMjhtfVBLyPHul1HVqkAj3wcnYoVIdw7Cfn
         s4uElNx3mE4ncaBwJMDcUL9IhsOSpRa/YthyW07j0KXK8R47IPPLGwUoDZgl2zjCyV9o
         iDd/I3DIlhZJMvh22KbAVDe2bN8BSppw5ZeckopCAVL5okHc88HoF2fBQ9mA1mJvkEGA
         eiMA==
X-Gm-Message-State: AO0yUKUVnZPcRTBiRX0EwV0Chf9NqYjVNNCktQ7xpqdieA5ie307ZMOL
	i8zFaEKuHN1Sytmucu+M3fo=
X-Google-Smtp-Source: AK7set8SW3QHYbwXotcXcSpGeoafSW3v8MoqXi0Lx268197z+LenVKqaA21glL+GqJf4mKDEYA+75g==
X-Received: by 2002:adf:dec8:0:b0:2c7:454:cee3 with SMTP id i8-20020adfdec8000000b002c70454cee3mr10386981wrn.7.1678262316282;
        Tue, 07 Mar 2023 23:58:36 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p7-20020a5d4e07000000b002c5694aef92sm14530016wrt.21.2023.03.07.23.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:58:35 -0800 (PST)
Date: Wed, 8 Mar 2023 10:58:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8192e: Remove unused Array
 Rtl8192PciERadioC_Array
Message-ID: <5c6eae1d-1593-40c1-96b6-8dcdf0b0799c@kili.mountain>
References: <cover.1678222487.git.philipp.g.hortmann@gmail.com>
 <ed1e0df7ed677c335340f42c1108e7b5c0f18462.1678222487.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed1e0df7ed677c335340f42c1108e7b5c0f18462.1678222487.git.philipp.g.hortmann@gmail.com>

On Tue, Mar 07, 2023 at 10:01:06PM +0100, Philipp Hortmann wrote:
> The array Rtl8192PciERadioC_Array is only used in function
> rtl92e_config_rf_path which is only called in function rtl92e_config_rf.
> In function rtl92e_config_rf a termination condition for the loop is set
> to priv->num_total_rf_path = RTL819X_TOTAL_RF_PATH = 2. The loop is only
> executed with numbers 0 and 1 for eRFPath. So the function
> rtl92e_config_rf_path is only called with eRFPath for 0 and 1 and never
> with 2 that would make the "case RF90_PATH_C:" be called. Remove
> resulting dead code.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
> V1->V2: Changed argumentation in the description and subject

Thanks.  This explanation is very good.  I was expecting that the issue
was in a completely different place so this explanation really helps a
lot.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

