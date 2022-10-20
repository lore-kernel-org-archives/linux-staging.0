Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C897B;
	Thu, 20 Oct 2022 11:34:15 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id g16so8636439qtu.2;
        Thu, 20 Oct 2022 04:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+QdMHmI8npmmp+iYes8th9cPUVQ/ZQTtTKsNhs4o290=;
        b=qheArqHOO71lgaxRDsfwopO5wrdcUUQ0s20Pl8qqXReJ13WtTpgMzxd9t6rvKMctJA
         JA7IkSeVg63ohWqHrjF7GkpLcWCR1YgyKPszJabKQJk74iIeR2F714hcTC5jLyVQ4DSI
         H8IDJBj5FSETG5M399pKEBTt+VMH8hjrCMm5r6O7AsYxkqOpkNbDz8guGIpBEERd1nqI
         V4BuE2GmjfrXL8dvJShmgeuXEGVL4V1MeySxm5IMkqrujd5+rK5FubbP5ufjWfpQ4dNZ
         wpvbdWmSgg/3TNtv+L9Xs2SRqCn7V//yuu0fK9LV2YwI10BweGOZhjK1JJQaWJhb6GSf
         pt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QdMHmI8npmmp+iYes8th9cPUVQ/ZQTtTKsNhs4o290=;
        b=6WBzvNoYyFF3IhY3ptQFlva3zkF6SSoLWwpmfUhC0BW5485IW5Ut5QkHXMDGVReUA6
         iN4Rz9vGxXbzxyGI1LeezdVCTMU3bhJy7lcxLyR3KGI4fyr6DlIvuJQ60ZMKp3xJGRZ2
         jjfsls9SHaB4SDPzq1Gyzoy4MAzrViBBrhauDFf7iA2Z3GgiliJKZ2fMqEUIqLkBZiiL
         uOCmtmN8BpT21ZLdsTaJ+hexhT0kwtfmsuobDSc8/PORp2CMCcA6ZovgmtUtNZTiTjEu
         vnO4tofSijJqc+dSp0JduU4Z+EgwqQmj9tbXd4VOQi9VWIbaj5tb9qoxu/kga2MMalAK
         yaWg==
X-Gm-Message-State: ACrzQf3pjg0Ak7HOxVdQVFplzf/hmaQE9LJgt7GEZX5Gy7SRSsQMpZQP
	6Lo7RlJu9QPK7oVWjv8GQVzN9WVcLTb2LfaKqcg=
X-Google-Smtp-Source: AMsMyM7JviV/L/yl/wxRPTtsFVdFqARChEv1PYvqyMCb1l0y7trenutZtt5XlmVfuNH+RGmWfIimVg9AZZAugCVNgXo=
X-Received: by 2002:a05:622a:147:b0:39c:dc0d:7d0f with SMTP id
 v7-20020a05622a014700b0039cdc0d7d0fmr10070312qtw.281.1666265654402; Thu, 20
 Oct 2022 04:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1Eqa7uKB+Wk+Mb+@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <CAOkYk0iU0B98JsH77avky--AS19V=GhQox2f_b4PAG3ZBB+SVQ@mail.gmail.com>
In-Reply-To: <CAOkYk0iU0B98JsH77avky--AS19V=GhQox2f_b4PAG3ZBB+SVQ@mail.gmail.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Thu, 20 Oct 2022 12:34:02 +0100
Message-ID: <CAHJEyKX=yyuyYFajs880CuPdc019dBOm_LCkgXHzjFaA-Jgt2A@mail.gmail.com>
Subject: Re: Request for assistance
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 20, 2022 at 12:27 PM Bhaskar Chowdhury
<unixbhaskar@gmail.com> wrote:
>
> Use forward slash at the end every single chunk or piece of that line.
>
> Example :
>
> Veryyyyyyylooooooong. Linerrrrrrrrrrrrrrr
>
> Veryyyyyyyyyyyyy /
>
> Looooonggggggggg /
>
>
> Linerrrrrrrrrrr /
>
Thanks

>
> On Thu, 20 Oct 2022 at 16:43, Ubuntu <tanjubrunostar0@gmail.com> wrote:
>>
>> Hello,
>> I have a diffictly deciding where exactly to split a long line of code. for example, this line of code is too long
>>
>> uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
>>
>> if i spit it this way:
>> uCTSTime =
>>         bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
>>
>> It does not help as the second line is still too long. I considered doing it this way instead:
>> uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
>>                                 pDevice->byTopCCKBasicRate);
>> But i did this on one of my patches and i was told it is not advisable to split a line between
>> parenthesis '(' and ')'
>>
>> how can i go about this please?
>
> --
>
>
> Bhaskar Chowdhury
> about.me/unixbhaskar
