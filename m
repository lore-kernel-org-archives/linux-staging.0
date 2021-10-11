Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6562C81
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 18:28:06 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so76476pjc.3
        for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=M2pNpl2tL7995hgKQ1256KxevURdkTwm4iin6b8QS5Y=;
        b=IrOou1ztG+GOXKgb/ZBl4oOVVNYCVqVBIMFLT0YcVm28akiUMuc/uxHh1il9MLTeU5
         /C/3I7/g5Cccvw+r7Pif+ZVPK0T/7/LyhMq6vM0B9p1nrc+wEzr8c2qpVCrtbq1+czOv
         Sb1c3L23EyZxy+qR8OFyp4TZXRNGQ26MyhbgA3I8ObQ9dHb5tiLetCTj3FETNvkRIr0W
         F9PDvNNbLlGv7pV+aj7GV+R90++x7VD8wYzpOzKmZcsg3gxggl9eMlJ5hV0RNMbnuFUw
         4EUn2a4avVlnRKOx5j408CdrZsVk3yl63jepKVR7SwugAjRLrosYl8+ss25RxZAAl6m4
         wnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=M2pNpl2tL7995hgKQ1256KxevURdkTwm4iin6b8QS5Y=;
        b=yK9swgCBoyBgvMkqy+JE7YyzW9KZk+zNIRYgGZmi3HSUuji8jp8q9IxynHbCTMKaji
         zcVJ2Z97M4FkfLzV9tZhjLx8wFxU5cxQ1BDD1VsfcB7fvBhnQqBxxtBVZGz11xOC7IoZ
         hHrFI+NVxY06QCq+DNziQCZujFJ2y3eW2cPjtuJblIqtTcCoX9JPFEbTGjRBbl60Tnkt
         8zLNDBp3ZYVvSvS9IW4NaqonS/ELcqTDY3Z553O+LeL3O8OO8UA+ize7AvvGo3eKilux
         7kqM+6Si/mbFHiAk6xKvkl0y+YteuR9voQ1SbQIKVCgpQ2j93uB04EhIsliVztNEWrZJ
         pzHw==
X-Gm-Message-State: AOAM530thIzRaOdcJ4Z9STwyBjvWOcIoU3CZEIpfRs2mf/m15QYJFTX1
	iNVeF8TXVPeIjt/LnZZ9YiU=
X-Google-Smtp-Source: ABdhPJyFaN9r6YI6sm7zODcYYrPjMhyRqfL5NMBXmAjzhTbMeHoOVfQfnEG1PLTti3Hu5EViJLyElw==
X-Received: by 2002:a17:90a:eb07:: with SMTP id j7mr696787pjz.20.1633976886137;
        Mon, 11 Oct 2021 11:28:06 -0700 (PDT)
Received: from [192.168.1.14] ([223.230.99.151])
        by smtp.gmail.com with ESMTPSA id rm6sm177320pjb.18.2021.10.11.11.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 11:28:05 -0700 (PDT)
Message-ID: <7ec390aa-1ecb-34ea-f422-b735888032b8@gmail.com>
Date: Mon, 11 Oct 2021 23:58:02 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2] staging: rtl8723bs: os_dep: simplify the return
 statement.
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
 ross.schm.dev@gmail.com, marcocesati@gmail.com, insafonov@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 saurav.girepunje@hotmail.com
References: <YWJ0vSrgsiKK7suE@user> <20211011123024.GB8429@kadam>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <20211011123024.GB8429@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/21 6:00 pm, Dan Carpenter wrote:
> On Sun, Oct 10, 2021 at 10:36:05AM +0530, Saurav Girepunje wrote:
>> Remove the unneeded and redundant check of variable on goto out.
>> Simplify the return using multiple goto label to avoid
>> unneeded check.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> 
> No, sorry but the goto bunny hops, the pointless do-nothing gotos, and
> the come from labels are all terrible.
> 
> regards,
> dan carpenter
> 

Thanks dan for your input.

Regards,
Saurav
