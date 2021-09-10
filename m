Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FC53FC2
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 16:49:09 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id mi6-20020a17090b4b4600b00199280a31cbso1530034pjb.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 09:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D73TCouYpmB9xTDq2w7pwNMpCZ26H76q6mSoWgYbZp4=;
        b=F43ZYCKmMprzrgdMer2LY0t1FWeggf1klI3wE4zuw9KgzxKPLwSUcLq68QagbKqcgS
         u0VbgQi7BC2XMZyYslXV24N/ciEdhGbIWfqgfBseRd38ZrP3eI+7SJQEnI7GqKfZAaMR
         q3hAwgZMiyBr1umfujg7FKciNwjoq9o3Kz4iYclfulVhUX17jd5SNphe0VrlITtTVsVW
         HE+x2l7uYN/EbTrEXl/4rvuTn+YC7CDq8oNL6h4+X/3iuWGqQxRBG5c7NbJ/aB9xrlcG
         0baweGLp/SP2nzj136hFGOJp8b880iaDG5mCLzvw2VbpcuC0YZ5UUv9hapNxd/tmnKKQ
         nNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D73TCouYpmB9xTDq2w7pwNMpCZ26H76q6mSoWgYbZp4=;
        b=XTsPm6T+QM7cMWD57Dmrl0INEHOmQoCWxrLyD2nvZmcmqky0S2vnFEMq+/2LnOrSQQ
         KJPcyyvwpHcyuRXtetxLlfXebmNMqk4vVl7zG0AAhZ4WLzue9YElWkSlhPLhPZqoS3o7
         VAmXvSUZpQu+lIwsCF4DGi5DtexYPVpOcFs3XWFYqIiJsssVLYsRy6dh/5e58b01J0h7
         s5iicBsOMvjCPJ8VGJNp7/mjCPcXI04kmJMHdfOW/ll04eFN9eA+qLBRka37UL747WBl
         S+BfD4uMOlbCX99ihwSbQWaTkrgLCLIuzNg/a1O9bPmRE+H+o/h6HqvHyi/r1GZslZUa
         J7eA==
X-Gm-Message-State: AOAM532YpI5pfdaxsseb2Sg5TJHSkopIUGqAu3z2z4Tp2jZ3T98eIIuj
	lLEui07/zinSzgbYp9hNsUE=
X-Google-Smtp-Source: ABdhPJw+XLEN+3FBF3KioB9P2490DQ0c/LCiYAWPjGRvjicH0jMd3fzKEg//lH4Jt+EWTnL0EVQeGg==
X-Received: by 2002:a17:90a:1991:: with SMTP id 17mr10627798pji.149.1631292548500;
        Fri, 10 Sep 2021 09:49:08 -0700 (PDT)
Received: from [192.168.1.6] ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id v190sm5537113pfv.166.2021.09.10.09.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 09:49:08 -0700 (PDT)
Cc: saurav.girepunje@hotmail.com, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8712: Move similar execution in to a
 function.
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YTsXXxtQn7QN6nIm@user> <20210910090045.GD7203@kadam>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <a31836c3-6999-339b-32f8-5f7d7f7e5b27@gmail.com>
Date: Fri, 10 Sep 2021 22:19:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210910090045.GD7203@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/09/21 2:30 pm, Dan Carpenter wrote:
> 
> On Fri, Sep 10, 2021 at 01:59:19PM +0530, Saurav Girepunje wrote:
>> In rtl8712_cmd.c function read_macreg_hdl,write_macreg_hdl,write_bbreg_hdl
>> and write_rfreg_hdl all are having same execution.
> 
> I get what you're trying to do, because this code is bad and duplicative
> but this is not the right fix.
> 
> Let's take read_macreg_hdl() as an example.
> 
> Look at how it's called:
> 
>     215          switch (pcmd->cmdcode) {
>     216          case GEN_CMD_CODE(_Read_MACREG):
>     217                  read_macreg_hdl(padapter, (u8 *)pcmd);
>     218                  pcmd_r = pcmd;
>     219                  break;
> 
> Then look at how it's implemented:
> 
>     120  static u8 read_macreg_hdl(struct _adapter *padapter, u8 *pbuf)
>     121  {
>     122          void (*pcmd_callback)(struct _adapter *dev, struct cmd_obj      *pcmd);
>     123          struct cmd_obj *pcmd  = (struct cmd_obj *)pbuf;
>     124
>     125          /*  invoke cmd->callback function */
>     126          pcmd_callback = cmd_callback[pcmd->cmdcode].callback;
> 
> So pcmd->cmdcode is GEN_CMD_CODE(_Read_MACREG).  We look that up in the
> cmd_callback[] array and it is:
> 
>          {GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
> 
>     127          if (!pcmd_callback)
>     128                  r8712_free_cmd_obj(pcmd);
> 
> So now we no that "pcmd_callback" is NULL meaning it will free "pcmd".
> And if you remember in the caller it does "pcmd_r = pcmd;" but "pcmd"
> is freed so that's going to lead to a use after free in r8712_cmd_thread().
> It's garbage and the patch doesn't really help.

One more thought here after the

     127          if (!pcmd_callback)
     128                  r8712_free_cmd_obj(pcmd);

r8712_free_cmd_obj(pcmd); we could do  pcmd = NULL; so in the caller 
when it will do "pcmd_r = pcmd;" it is actually making NULL to pcmd_r. 
On r8712_cmd_thread there is check for pcmd is NULL or not before 
execution on pcmd.

pcmd = cmd_hdl_filter(padapter, pcmd);
	if (pcmd) { /* if pcmd != NULL, cmd will be handled by f/w */

Please let me know you thought on this dan.

> 
> The right way to fix it is to get rid of the cmd_callback[] array.
> 
>     129          else
>     130                  pcmd_callback(padapter, pcmd);
>     131          return H2C_SUCCESS;
>     132  }
> 
> Getting rid of the cmd_callback[] array looks like this.  In
> read_rfreg_hdl() we know that the callback is r8712_getbbrfreg_cmdrsp_callback()
> so we can call that directly.
> 
> diff --git a/drivers/staging/rtl8712/rtl8712_cmd.c b/drivers/staging/rtl8712/rtl8712_cmd.c
> index e9294e1ed06e..51a6abb27d41 100644
> --- a/drivers/staging/rtl8712/rtl8712_cmd.c
> +++ b/drivers/staging/rtl8712/rtl8712_cmd.c
> @@ -174,11 +174,7 @@ static u8 read_rfreg_hdl(struct _adapter *padapter, u8 *pbuf)
>   
>   	if (pcmd->rsp && pcmd->rspsz > 0)
>   		memcpy(pcmd->rsp, (u8 *)&val, pcmd->rspsz);
> -	pcmd_callback = cmd_callback[pcmd->cmdcode].callback;
> -	if (!pcmd_callback)
> -		r8712_free_cmd_obj(pcmd);
> -	else
> -		pcmd_callback(padapter, pcmd);
> +	r8712_getbbrfreg_cmdrsp_callback(padapter, pcmd);
>   	return H2C_SUCCESS;
>   }
>   
> 
> regards,
> dan carpenter
> 

Thanks Dan for review.

Regards,
Saurav Girepunje
