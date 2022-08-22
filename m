Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625547F
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 07:47:42 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3246910dac3so269545377b3.12
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 00:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=wKlbRSkpVlRwtCLX0mwrPVGrcxPNmPGYkB8qt5FFx90=;
        b=DceuZphh2rFNT4MI5c0n4gVI5k+aLeHoqbfZSpNOugIO04lJ4Mx2mvic2ACS5kq5+i
         FsYxYFkrAdVSYt6vZCHU1w9PEJJYS9k86ElH548QcgiO++34pfnDvGNq4BJowa6CVtnA
         ufq4158mISPaJmGZ08lRJ3J86R3XJd82mn0eeuJnvh1abDq/vSS+Z8hHKrWN0SQ/Y30i
         e2epG3oJrC/NOrjAKSSYtzV4GSm7CGdSLcqUKP59BsvnwCoUbEmlPVaXCfOVL+C9wvr/
         FBKjuo0IbhIEyWVkSyA1LMg4ugXyyIg77MUeJvT2Nl0hFA5wS2HjiqaeHMFD2nrlSPQM
         Pi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wKlbRSkpVlRwtCLX0mwrPVGrcxPNmPGYkB8qt5FFx90=;
        b=Dz9KQrwc7jpQwY44tKjbgl1YgQr7qzHPtPr9bbtn0a7sg3qwwtjrYrCJcBts5s3QpF
         HAUDT3ZKCM2rWj88BtuDvTB/yHwldCeVyJwxuyWN3g1LygfUv9oLDyh5rXxvvE3quKRq
         Rsf5wZG2daXdJkE7MjoleFUAV9DWA1aS4W7My362wRcIV77knI+vSqctp7lj+M7xSYM5
         sqOXUXoOhlWB7OLDUNpSbGooyeY+YZw2qUNkoAqhjDbPoaHlvkiubFd9uob6bCgt07+A
         Y9xbHr6eqNh7VKyXYbvH+peS9coz50n8KMlYJGyn8MFuXLfGamtiZGh3rzHhPaP/Y2Gn
         KLAA==
X-Gm-Message-State: ACgBeo2q2JRY44Gft0/qGiAR4lvaLqTWSA4XMZE7sltk4x8Cxh5Hmww0
	alN9iGFq0+lksyCCOKGm2w+2bpjnE0jH7+Xfwjs=
X-Google-Smtp-Source: AA6agR4ohKjpbJQP3GkDP0pnjwN8sZsDo5H0BGBNw6m2rx5n/RZe9E/2cqeLg0ZG0Ccc6xUkzobxz+dDpNk7rrN5H9s=
X-Received: by 2002:a25:2e11:0:b0:665:746:6ac5 with SMTP id
 u17-20020a252e11000000b0066507466ac5mr17664814ybu.481.1661154461373; Mon, 22
 Aug 2022 00:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1660916523.git.namcaov@gmail.com> <7ff2d658863db4fd5eecc1a53f682510c2765c3f.1660916523.git.namcaov@gmail.com>
 <20220822073352.GA2695@kadam>
In-Reply-To: <20220822073352.GA2695@kadam>
From: Nam Cao <namcaov@gmail.com>
Date: Mon, 22 Aug 2022 09:47:30 +0200
Message-ID: <CA+sZ8B-HzLbLdBP5dMQg3j-201Ca6QxjiRjO=20hMADbMCgEOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] staging: rtl8723bs: remove function rtw_odm_dbg_comp_msg
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: lkp@intel.com, Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thank you so much for letting me know. I will try to make it more readable in
the future.

Best regards,
Nam

On Mon, Aug 22, 2022 at 9:34 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Aug 19, 2022 at 03:49:35PM +0200, Nam Cao wrote:
> > because this function is not used.
> >
> > Signed-off-by: Nam Cao <namcaov@gmail.com>
>
> This patch is fine, but in the future can you please treat the subject
> as separate from the commit message.  "because it is not used" is a
> sucky commit message.  What is not used?  What are you doing to it?  It
> doesn't start with a capital letter.
>
> Here is how your email looks like on lore.
>
> https://lore.kernel.org/all/7ff2d658863db4fd5eecc1a53f682510c2765c3f.1660916523.git.namcaov@gmail.com/
>
> Try to find the subject in the middle of the block of text.  People are
> often only going to read the body of the email.
>
> [PATCH v2 1/8] staging: rtl8723bs: remove rtw_odm_dbg_comp_msg()
>
> The rtw_odm_dbg_comp_msg() function is not used.  Delete it.
>
> Signed-off-by:
>
> regards,
> dan carpenter
>
