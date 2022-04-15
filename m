Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBC87A
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 05:22:40 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id s18so13773570ejr.0
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 22:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2kVVWIn4+ecvL3sYl2+PczgNl0kQB4IqaH+XmO1cCTM=;
        b=LkJ49FHDSq8yLqisCcngHd6LA8BVgBrFyzP+beFfpWfWErzakEMVHrueMnES3zpyA5
         RZ9IqUvZrHv23ZSSiS9pOJnoMo6yJZYXT+noKo89pwmlKtWkYryEFsghwigatChoGxCE
         3haxC4Zo+PbLew/hGx4GKMYn/mqVCcm6v6rn671/VD1obOHKsgW5oG2ieiEBRgk5F66J
         gUBU0ZYR8rBN9LSwR4fICBUx4nuDhq4KuOn4k51UoersScuUZh3bI80mhIMWRRkGzlzh
         24DQGVtskF8dDEUzdmHuWokRndeY851dz8DrTpx6/hojsdUmjUP89IYQRP1/Y6WkmNvv
         /gWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2kVVWIn4+ecvL3sYl2+PczgNl0kQB4IqaH+XmO1cCTM=;
        b=MTPk4imGV55RzuFzNzVtkS9Znga2B6bxb2tolcdkm5uF8R6kDfjx2Wu5EB0yphLQbn
         YNk5tN0Fg3oYgHqJHT/tvzV+FrIvlzovO9/fTZAC9IyTqy1c4sgA9JqDOz3NjB6KbXhV
         rBNIFDy5daUJgrS5X4SMEgl38Nxa5R5ZnLusB8oQ/peSprXXxKxpnHEAJVFbmH0/AZF2
         vZ0usdJ+dC0ti/lCNbKMHH2ysToT6bQPesHCGHCljjkoz8w9z5RrXe2iUFMWbsRVhgkb
         BmKF1m7swRhs1vKOlnNBAo0kVUX7T07i8Y/17+vMRKYyqZKhAZyEHhL+fMMTaC7S8mbV
         WCtQ==
X-Gm-Message-State: AOAM533L/XRrZW6CZ4vtwsrCd1mJFfqD8Qo44q+B7J97oqWTX2kDYvhs
	KoqUqkRzNaUoNBXg0Kcsf5I=
X-Google-Smtp-Source: ABdhPJwP3dV8IYq2ZWLU3I0rvu5B/j2WfmphCivl5cktVtOZCgDduhQ3flQZo48fGOogLKNONLZx+Q==
X-Received: by 2002:a17:906:c149:b0:6df:f047:1698 with SMTP id dp9-20020a170906c14900b006dff0471698mr5085735ejc.16.1650000159165;
        Thu, 14 Apr 2022 22:22:39 -0700 (PDT)
Received: from leap.localnet (host-79-43-11-75.retail.telecomitalia.it. [79.43.11.75])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090600d600b006dfbc46efabsm1309308eji.126.2022.04.14.22.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 22:22:38 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, davem@davemloft.net, dan.carpenter@oracle.com, len.baker@gmx.com, dave@stgolabs.net, edumazet@google.com, Haowen Bai <baihaowen@meizu.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Haowen Bai <baihaowen@meizu.com>
Subject: Re: [PATCH V2] staging: rtl8192e: Fix signedness bug in rtllib_rx_assoc_resp()
Date: Fri, 15 Apr 2022 07:22:36 +0200
Message-ID: <8973092.rMLUfLXkoz@leap>
In-Reply-To: <1649988571-19923-1-git-send-email-baihaowen@meizu.com>
References: <1649988571-19923-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On venerd=EC 15 aprile 2022 04:09:31 CEST Haowen Bai wrote:
> function rtllib_rx_assoc_resp () unsigned errcode receive auth_parse()'s
> errcode -ENOMEM.
>=20
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
> V1->V2: reduce return random value; print its own error message.
>=20
>  drivers/staging/rtl8192e/rtllib_softmac.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20

> [snip]

It looks like you are doing too many things and that those aren't even=20
discussed in your commit message.

> @@ -2292,8 +2292,8 @@ static void rtllib_rx_auth_resp(struct=20
rtllib_device *ieee, struct sk_buff *skb)
>  	if (errcode) {
>  		ieee->softmac_stats.rx_auth_rs_err++;
>  		netdev_info(ieee->dev,
> -			    "Authentication response status code=20
0x%x",
> -			    errcode);
> +			    "Authentication response status code %d",
> +			    le16_to_cpu(errcode));

Why did you call le16_to_cpu(errcode)?=20
If I'm not missing something, it looks that auth_parse() already returns=20
native endian u16 values.

Thanks,

=46abio M. De Francesco


