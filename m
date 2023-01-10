Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FDD17E5
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 05:21:00 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso5965071wmq.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Jan 2023 21:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sNxTDu1tbYQEdXfie9Jbpp3SHUANSK0JEbtFP0ICaTM=;
        b=ZLSOe8ClyEapVdx1yzs1T3U2/SqDyDt3KoGCn2te5FckQ9yAlUhx8qRkLL0pBnzDGS
         ZVJg6Fi841QvWRa5thSZmohxgCJBgFueG+2Qbxz9TrfIOxzeUhL4vdO9uaqV4BiHpomW
         1K7KcKNAkOJlNDOsOEfNuwIzT/HWbGaGKFABdUmz1SmSCkJ1TO8wPV+f+eMDJNYyA9Ha
         frskjLCteUoRNAFL9C1/FmeSjrlMLAYMv4HC/NV4xYXvPk+EEm7HfrjI7ulTo+Bh01Hs
         ixJwgQ2N8xhdbtxnfBbukKHNnnnd8+FsvCGIQnxzXL9UhuVggcAQkoAGQalgADeQWWhi
         cLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNxTDu1tbYQEdXfie9Jbpp3SHUANSK0JEbtFP0ICaTM=;
        b=7n0nbf9q0PRnM2nNu8I2e96C8GjPsCV1RjZue5A9wO2FsRrUlvkFTpY44GaqFpOIlR
         hTy6oZg4+k9ZM/Ozalx/KVwxgOzDeZSB5Lng99akgo8qiHXGUal8+QnoYs1VXg7ipgrI
         yy4pa/TzLiZtHaovQOc2/8jXZKz4aJjQh+4etRXbxfAJgs3RtED0sxW/JAUhzMrR/UVs
         9R5oV9YimSsD81+AtrPKdlpnlxU8e+IkirrJzaUGtUtPZx/Y4S6UULrTzLiLDYZLFW+R
         PcCDemlOmHp2g7+pdfHw9x/53/MNC9yXvVtqD7G3ha7Q1S4Ew0rUhfyA8k7C3LeaLUg3
         FOVA==
X-Gm-Message-State: AFqh2kqC4kLYeZLj/Rgfyyi7F/WFqta5zQS8T8F18A1ynNNUDnX0PDFo
	x5ELIUfrFul3elzEfAoA6qw=
X-Google-Smtp-Source: AMrXdXs2wO0EkVhPe1wvgzN/fFSh//nzHHbsOOacJjbjhK63xlNvKXiIN7TM5BHXN1erf+2pMrwhaw==
X-Received: by 2002:a05:600c:4b1b:b0:3d2:1d51:2477 with SMTP id i27-20020a05600c4b1b00b003d21d512477mr58588101wmp.11.1673328059261;
        Mon, 09 Jan 2023 21:20:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003d98a7aa12csm20277019wmg.16.2023.01.09.21.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 21:20:58 -0800 (PST)
Date: Tue, 10 Jan 2023 08:20:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] staging: rtl8192e: Rename variables from
 r8192_priv start with ChannelPlan
Message-ID: <Y7z1rj+O0vUUJRM0@kadam>
References: <cover.1673290428.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673290428.git.philipp.g.hortmann@gmail.com>

On Mon, Jan 09, 2023 at 08:08:15PM +0100, Philipp Hortmann wrote:
> Rename variables to avoid CamelCase which is not accepted by checkpatch.
> 
> Tested with rtl8192e
> Transferred this patch over wlan connection of rtl8192e
> ---
> V1 -> V2: In patch "Rename TSSI_13dBm, Pwr_Track and NumTotalRFPath"
>           Changed TSSI_13dBm to tssi_13dBm instead of tssi_13dbm

Thanks!

regards,
dan carpenter

