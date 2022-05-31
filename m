Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136777E
	for <linux-staging@lists.linux.dev>; Tue, 31 May 2022 17:17:01 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id e11-20020a9d6e0b000000b0060afcbafa80so10036649otr.3
        for <linux-staging@lists.linux.dev>; Tue, 31 May 2022 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p/oEfQcvC4y8mbzff9uEi91rnRRVUl2cW2LAWQsIYNE=;
        b=fZwluBYEsdK3ua48/g8/ZChC0JNS/Fcer/NXU7xb4xHNzAta8PD8F2U1e98Ngva2oF
         TY29/D0cMb4tlYMr01HnlxS+mXLzE7Vdr8FlCIqEwnHIBPpXlNNWDG+epPbP0rRtps7I
         dvI5RRafkmqXJaWHxIxKFUc/8KScC1a2pEMpiCHluLnmrjehwrqmKEgz9e+qSGF3undM
         GDP/Sd11QDMXX6D7JEqXAvbXa3BFGUecwYX/lQ9S0su3CTRRTTtWRdeL5uegmkwEPOT9
         i04VjpDr3A82Pon3rpzm4ns/RCYYat6s0LkWdtgGTPhEgqgmPMSnDyeHgs4JxSl22isP
         DrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p/oEfQcvC4y8mbzff9uEi91rnRRVUl2cW2LAWQsIYNE=;
        b=2dsdXDVURTmJqE2L7AY5s+beuyDGIIGtbYvbVlSt2rItKyllYDJ8LQ4nxF8IOr80jO
         77s4mtzpvke2nqAcD2FuDk0RnIfG8WOFCRAM4Z/wfbTf/o28je+OntpFdhsk5uToiEUL
         F4KPVPNikmbDGhye7PQ9GZH9HdHgNCiJtWsZE2UCDIqZJCN6Fv576jCev8pTZeRKIC8X
         RYFRlnwfQe7nrEnzzlZ+ZchEdZ7Qz7DP/tWmr7cHcX/WRj0lO/CA8t/yCJY83n1Ptsq8
         aqckGOKCiZQEXFhvAPot0djxkp/tedUC/kXtbNbhZYSLrIvXHjeIShjwCVe9QmsXjImG
         MrZw==
X-Gm-Message-State: AOAM533EpJRygj2JO/r6B5uDNXem7Aq2zi3lZz6M75mmhil1pbxB4irf
	rXX1Ku2MUH76RVUWtE1Qfho=
X-Google-Smtp-Source: ABdhPJyX8H5+oOd23XoDfjmAhlDXuYwuGHrqKF5xqWC8wTN5E+0m9Yx8UDiclqcHAdhJacwyqXL7lQ==
X-Received: by 2002:a05:6830:348e:b0:60b:f4b:c306 with SMTP id c14-20020a056830348e00b0060b0f4bc306mr16910221otu.297.1654017421098;
        Tue, 31 May 2022 10:17:01 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id v1-20020a056830090100b00605fd407259sm6438194ott.3.2022.05.31.10.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 10:17:00 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <bf78b567-5c69-c968-3dc4-6c94eeb8d77a@lwfinger.net>
Date: Tue, 31 May 2022 12:16:58 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 0/2] Fix some compile warnings in v5.18+
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
References: <20220531013103.2175-1-Larry.Finger@lwfinger.net>
 <YpW4WKxKIIgY0l7m@equinox>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <YpW4WKxKIIgY0l7m@equinox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/22 01:40, Phillip Potter wrote:
> 
> Hi Larry,
> 
> Both patches look good to me, however I've already submitted a patch 10
> days ago that does exactly what your rtw_xmit.c patch does, in
> addition to fixing the changed error handling semantics for the relevant
> function (in f94b47c6bde6) which broke the driver.

Phil,

Sorry I missed your patch. I have been really busy the past month on another 
problem, and I was not paying much attention to r8188eu.

When I built a mainline kernel in the middle of the merge from 5.18 to 5.19, 
those two warnings stood out.

Your patch should be ahead of mine in Greg's queue, thus mine should fail, and I 
will get the "does not apply" message. At that time, I will send the other 
patch. As both of us missed the 5.19 merge, the build warnings will persist 
until 5.20, but no harm.

Larry

