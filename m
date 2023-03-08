Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA31E7B
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 07:59:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so563871wmq.2
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 23:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678262354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=src9kyzL2qKyLwD+KhZmySOAfWQnjiEOGoaEH2ByILM=;
        b=mipK7iDSwS3Yxvso9vbyyVK87puLNOTY0XWzkQiXu3dhJUKraOMdSgoksS+Azef9Dk
         3czr8KqIKEL803WTJlEuIJw8EvSLb23zhK1zwdpfVcc3QsX/AEnl5+D4mSYEEyKs3yyQ
         JBDdeOS70o+V6ji9oiNa8bKsEx3o7SIfFlPdNM2DKeN8dva00LHxAiTbL3YQnsbmU7E1
         PhPM/VVV/BzeHn+dAkj5ajnvhAZDl9xGTTpnbCBpT62O5/CDS9nPtbbjlhoyJs6zfI4s
         4q3UjI+DYrQUfWojQjQcyE/o/zGFs1YRHcpDPCm5sbwMApXImJrv7Gnh0C9f3FXUnAoc
         mBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678262354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=src9kyzL2qKyLwD+KhZmySOAfWQnjiEOGoaEH2ByILM=;
        b=x1D02fOuw7SZuBpyc4UGDdmVt/cP9/b77SllmEDnNwCIF085EFf0pKi/VDw8dKFjDi
         IvRmpYD9yPVDoYrEOrn3uIgRL4rbD2tvXn8HhpPiwRR25odZUfSVKx6qqEAh2JIXoNvQ
         3WH7qDEpN4nAaRTnzbfw/5FzI+N2yOtsdiaF3vuQa3sKz3uGyeiIvXv32vaKwdKoeueB
         /RoZ3SHmsiBhp8zbKBPvdcKMK6D+bHbkbfvKTwUvYkl1ckeZErb82U/NBWbP2akaU/yN
         vS/vc7qDMIzm1B4zoFSawSUqA95XEaBbYkXK4XzmyGW1nq6E5BIksexrC83c1fgNwwNQ
         hW5A==
X-Gm-Message-State: AO0yUKVIlmc2IfbsuTErucwD0mED4yYFLmVDPfopPazdwbT+nMettNEv
	tufEgkl5YAhh+CTG7LVVeNk=
X-Google-Smtp-Source: AK7set9qO6D7y2qLGArvOc0L/cMGzSa2wGhmgeDZxxVJX/mOQoz+kQpzUlZmSgtQZU+rLBlhh4YPhQ==
X-Received: by 2002:a05:600c:6001:b0:3df:9858:c032 with SMTP id az1-20020a05600c600100b003df9858c032mr14204830wmb.7.1678262354117;
        Tue, 07 Mar 2023 23:59:14 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c485600b003e203681b26sm14510248wmo.29.2023.03.07.23.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:59:13 -0800 (PST)
Date: Wed, 8 Mar 2023 10:59:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: rtl8192e: Remove unused Array
 Rtl8192PciERadioD_Array
Message-ID: <66c038a7-3447-465c-88a6-ccef10c149e1@kili.mountain>
References: <cover.1678222487.git.philipp.g.hortmann@gmail.com>
 <608ced17b85ca321fdc0026c686e3c62a9d6d8cd.1678222487.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <608ced17b85ca321fdc0026c686e3c62a9d6d8cd.1678222487.git.philipp.g.hortmann@gmail.com>

On Tue, Mar 07, 2023 at 10:01:25PM +0100, Philipp Hortmann wrote:
> The array Rtl8192PciERadioD_Array is only used in function
> rtl92e_config_rf_path which is only called in function rtl92e_config_rf.
> In function rtl92e_config_rf a termination condition for the loop is set
> to priv->num_total_rf_path = RTL819X_TOTAL_RF_PATH = 2. The loop is only
> executed with numbers 0 and 1 for eRFPath. So the function
> rtl92e_config_rf_path is only called with eRFPath for 0 and 1 and never
> with 3 that would make the "case RF90_PATH_D:" be called. Remove
> resulting dead code.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
> V1->V2: Changed argumentation in the description and subject

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

