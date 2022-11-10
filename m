Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0F12DAA
	for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 11:01:07 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so903733wmb.0
        for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 03:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l84LEgQqFAdGVkHqr934QyhT+PG4ypnQNWiowlrSNlg=;
        b=JFjJEvY7H7kKRYvWCxpdFTXRXz+lJzpevJwMtmWpc97TBlQM1tL5nMKQ+BlsUdcgf3
         bMwEHT1X9ZD6dlsFm3EjNxdsrLLGFUNyzQiflVtndRmnddjL2OaUCMNanf3a0gt1JmqP
         FNfpu6k6A1C0IrPNNyD8MNTyinXiUi+MUeSOJ1aLxU+YHkGraW68U88FefRLq7x6t6FH
         h6ZFeUmfzxSjCWzwCfQdgzQZdmEMqz+e6mE47Xx24egAhqy0Ol5fFchAQtzmoLqhLWZ+
         wOKnBxMDvId6iP5RP2O8joZkkwBybrvR9uMaSeo6bhhPFTpF4DVASFVChkXZauy3qAgl
         Rnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l84LEgQqFAdGVkHqr934QyhT+PG4ypnQNWiowlrSNlg=;
        b=0Y5TKfL5KQDe92orvLN/CejG6jNp56WXqnbo541BV4WiaF5CedMyQvhYzI/yC3DeRB
         E18UymPsUaPAYPLa6eY9xJcYjt7PQmqkXFmRkYAFhZF2T8B4l+MJu6NGHKn+lebIp7XD
         nW6KISbPftlZSv5WOcYIq+hZ6aqq0btbWLV4Rrin5cnXesNmQYUW9T5Y/0Fvw6jzhS2f
         P2sL/k8HkpQ/10KpNgqNTYbGc+/jvJIslBKlZfNwbIj51nfH1gUSUxWSCspvVD5SIm6w
         8gcb9I9haFieIs9UnCWsmEmlJsqTb6POJo0emo+ZfF2Ckdym3p1s3SAIzLtBoumvm3nJ
         KpXw==
X-Gm-Message-State: ACrzQf1bzUmZAAJRqJqxwsVoelKRLU89ucjA1rO2Kxk2n68XIYGFyOEG
	QRb0XQzbwqXwAcx/EUtY2l4=
X-Google-Smtp-Source: AMsMyM7iYwRfhVvSq+Ma2Ov3nq1pe02Ua0Ec0gnqrqH4XeOa+9o23QctpGw9egJLkTuoTZeFL6U7tA==
X-Received: by 2002:a05:600c:c1:b0:3cf:63e3:bd73 with SMTP id u1-20020a05600c00c100b003cf63e3bd73mr42747185wmm.206.1668078065325;
        Thu, 10 Nov 2022 03:01:05 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b003c70191f267sm5153978wmn.39.2022.11.10.03.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 03:01:04 -0800 (PST)
Date: Thu, 10 Nov 2022 14:01:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jacob Bai <jacob.bai.au@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] staging: rtl8192e: replace macro defines with
 variables
Message-ID: <Y2zZ7SXu+Wk6H68D@kadam>
References: <cover.1668075486.git.jacob.bai.au@gmail.com>
 <354847ce7b2f9ea4dc549bf13656192c1db7c231.1668075486.git.jacob.bai.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <354847ce7b2f9ea4dc549bf13656192c1db7c231.1668075486.git.jacob.bai.au@gmail.com>

On Thu, Nov 10, 2022 at 09:35:11PM +1100, Jacob Bai wrote:
> remove marco defines of array length, use variables instead and
> initialize them from ARRAY_SIZE().
> 
> Signed-off-by: Jacob Bai <jacob.bai.au@gmail.com>
> ---
>  .../staging/rtl8192e/rtl8192e/r8192E_hwimg.c  | 31 ++++++++++------
>  .../staging/rtl8192e/rtl8192e/r8192E_hwimg.h  | 36 +++++++++----------
>  .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 20 -----------
>  3 files changed, 38 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
> index 8920283f340e..ec9e2de4c942 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
> @@ -6,9 +6,10 @@
>   */
>  #include "r8192E_hwimg.h"
>  
> -u32 RTL8192E_PHY_REG_ARRAY[RTL8192E_PHY_REG_ARRAY_LEN] = {0x0,};
> +u32 RTL8192E_PHY_REG_ARRAY[] = {0x0,};
> +u32 RTL8192E_PHY_REG_ARRAY_LEN = ARRAY_SIZE(RTL8192E_PHY_REG_ARRAY);

ARRAY is bad name for an array.  It's like saying "int variable_i;"
It just makes the name longer but doesn't add any information.

Get rid of the RTL8192E_PHY_REG_ARRAY_LEN define. Use ARRAY_SIZE()
directly in the code.  This is no need for a layer of indirection and
obfuscation.

regards,
dan carpenter

