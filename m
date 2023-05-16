Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C23334CC0
	for <linux-staging@lists.linux.dev>; Tue, 16 May 2023 10:52:13 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3078aa0b152so7547590f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 16 May 2023 03:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684234331; x=1686826331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7IWQHlMbXDpvKFEOkE+mWOLjcST6eVfYEvzec3CKkKY=;
        b=y1Ayu4YbLMKOaHHAEsIHOAKmKifNuAHjJeBoLPe0OmQOw8UHBlz4Z/vuYeyjmAi4zL
         ecZTeoX+/JpwFdYqFxIKr4+i77VkEhak3dG33mJ2OkVficSbUzseFpfoTtcR0iw1rIqO
         /W+bL0MVt1Hilbx8wN41a3SIPx8wazSS961iDnGe+7BJaAv/BMJiz6qG9mfbl6270UwJ
         jJ68dk+R0EweeIUjvb96nQ9PbIPBJOBbEg5BkwFtpw0dRCYVUeJNRjQCDQPCzJhQ75wq
         o5g3drlsFfQbQ54faBevMP1I7oTkXxiLv+EurXnWCgv/snoXmVgTu8gQFS0hnvYohck6
         Patw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684234331; x=1686826331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IWQHlMbXDpvKFEOkE+mWOLjcST6eVfYEvzec3CKkKY=;
        b=YFTFWc8JFbLCI4gzNEYl5geKQj7Vfd13Qh18Bpb0mKCM28pyLkVTiMvluLIwDln9MC
         rETe7Bx86vsy9a/ZnAiXcg6F3j6y3V5g27RcIH6zLPZAum49SNjGWQCW3bxDq8Ud/vaP
         Gtx0veRuCDqKEZQ+lRL+unvEYr1J1VvGop933TY8EkzZkt803kJ/hiMU7zzEnvilV9VY
         Kz/0MwCXxyQQ8ha+EwJYsY4jbmAzTpI40M/JgyNe5XJIV8fW8QY6HAPqT7o+xbffgP7G
         eFG6ZZQYGD/ILQg7EQBoDkhj4jpkiUwBV7O7cz94Wun/GDZsshjVGPklnkaym9b3SuXY
         b/xQ==
X-Gm-Message-State: AC+VfDxCSN7oZ38WJ30sKcjy1iVmbA5roV87BJoHHSvigImGUzI+ksOn
	ThQqfumzQpuk3fmYKV1IOwQa2A==
X-Google-Smtp-Source: ACHHUZ6VFcaUJX5oLEt5iwEFICe8KPibexc3h6Hn9ikn1nygKX9v8fcYJXZMU01dtTEbQgXipcbAJg==
X-Received: by 2002:a5d:6d4e:0:b0:309:22ba:dcdc with SMTP id k14-20020a5d6d4e000000b0030922badcdcmr3762731wri.42.1684234331578;
        Tue, 16 May 2023 03:52:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d63d0000000b002e61e002943sm2122445wrw.116.2023.05.16.03.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 03:52:10 -0700 (PDT)
Date: Tue, 16 May 2023 13:47:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Atin <hi@atinb.me>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: add whitespace before operator
Message-ID: <97bfa093-dc1b-41ed-ba98-b148525782a4@kili.mountain>
References: <20230513120950.66944-1-hi@atinb.me>
 <2023051346-pruning-porous-9570@gregkh>
 <kqmc20X96l-opyiHjxQVIniliwVLkqa0w-6JN3DeMm7KEtJbVeRZ7b9ORH0xA1CQ1QnK3KcqgNcOq6hp9bqgslfW3gHyU7AwlcMwF3P_Tc4=@atinb.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kqmc20X96l-opyiHjxQVIniliwVLkqa0w-6JN3DeMm7KEtJbVeRZ7b9ORH0xA1CQ1QnK3KcqgNcOq6hp9bqgslfW3gHyU7AwlcMwF3P_Tc4=@atinb.me>

On Tue, May 16, 2023 at 10:31:07AM +0000, Atin wrote:
> I've sent an updated patch with the changes you suggested, please check.
> 

Please wait for a minimum of two weeks (not including the merge window)
before asking for feedback.

regards,
dan carpenter

