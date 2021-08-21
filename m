Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDC3FC1
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 14:21:18 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id x1so5031562plg.10
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9Vyw9fxWTiOhTDxiqjbBhpUmVvKmdQD+9QSsMdHpwzQ=;
        b=pDPb/x/7SdEBSQQKtRXScgHNOnUCFON7ozJGBQCEcUMmHNf6LB5zV2FofBIie25kZx
         mMBYkBrEGEBaS/qyryNIFOWkyxQZRTVPA1jlkKNT1FlkKkCBpXAYM6+XCraLW3VSO2Bl
         7v7YIXYSARnHjmKN1YyOQfAhY+I1LYagAnWRQgX9C75q6xsEBfB3F+BsFjH1K4WMOFdl
         y3gnxvKsSOy5dcsPg2BPQpQxemNjARQgAH+HsovBmtIGb3MHeB/g/GkJKGFPgH35kwnz
         sE7je0je6ZzS4ThdI+Zurn+Je53Tba3ndqCpFxUoDc5kwvlhxSDSA1T8I4z8Ba5sUGsg
         iCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Vyw9fxWTiOhTDxiqjbBhpUmVvKmdQD+9QSsMdHpwzQ=;
        b=YYU8YjORnmUEefO5Tu9O60/YXCcneeGFLYqg4WYyXUdDXeOhI9o2jRpPAjvjOhASnB
         RE7LN0PGczQqDUff/vmJXFg4rL0LfTZ5Rp/HG6cZ1VE8kCNgMk5epeIuUkC3kMus9r1J
         If4ABWzCHtuQMMKCS+x3QHqaV27dm+qThp+0ZygKcm6PdYTjIoim8p9bFGQsm9j+dx9D
         lSOucDLtJmaVvpZBh5NXxfhk9/CbxdYJUUat/f5id344MSCNdFsY5GletKmiwSliV049
         iVoSfRTQu7Gwj9EbIwXwHvS0bmC7M7WaVH+pZBM0W2+4/iSn4MeDmS/OSjzvu0F/MZ3I
         J/XQ==
X-Gm-Message-State: AOAM531VRAs3WpfBZzAyhgPVus6xxoJ4xphDTSCPovXI0QM5GqTi2kzZ
	buZqi4YzVGgRGO6u8dikRtU=
X-Google-Smtp-Source: ABdhPJwsmFy69f4DXdF1WOgto05mLEITK96V++62xAMrycMA90htD8PRNXJZWkEhXb/+AKj9TsDKFg==
X-Received: by 2002:a17:90a:4549:: with SMTP id r9mr10229611pjm.147.1629555678527;
        Sat, 21 Aug 2021 07:21:18 -0700 (PDT)
Received: from localhost ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id d13sm10314666pfn.136.2021.08.21.07.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 07:21:18 -0700 (PDT)
Date: Sat, 21 Aug 2021 19:51:16 +0530
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] staging: r8188eu: cast to restricted __be32
Message-ID: <20210821142116.4febwhcnx4wjyprw@xps.yggdrasil>
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
 <602aefc30b0d979dc6e402d52da2f096ea5c67cf.1629360917.git.aakashhemadri123@gmail.com>
 <4be5c5fa-c3fd-8c86-e904-8e2e60173380@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4be5c5fa-c3fd-8c86-e904-8e2e60173380@lwfinger.net>

On 21/08/20 04:44PM, Larry Finger wrote:
> This patch is wrong. All the documentation I could find tells me that the
> multi-byte entries in dhcph are big-endian, thus the new line should read:
> 
> 					u32 cookie = be32_to_cpu(dhcph->cookie);
> combined with:
> 
> @@ -649,7 +650,7 @@ struct dhcpMessage {
>         u_int8_t chaddr[16];
>         u_int8_t sname[64];
>         u_int8_t file[128];
> -       u_int32_t cookie;
> +       __be32 cookie;
>         u_int8_t options[308]; /* 312 - cookie */
>  };
> 
> The old code was, in fact, correct, but not in a way that satisfied Sparse.
> 
> Larry

Thanks for the review Larry. I understand now, will rework and send it
through

Thanks,
Aakash Hemadri
