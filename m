Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281FF1C36;
	Tue, 28 Mar 2023 08:48:46 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id q102so10163026pjq.3;
        Tue, 28 Mar 2023 01:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679993325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2EU0PyNq3O8MZWQ5fwe8D0KcNrdW4uSY2h1xR6nDBTY=;
        b=O1fseohERVPEn6YJLD9y3VUPQsGzrgbrkJIfTSl9xCaOo75kgq43d8pjF3GzYx1/6U
         yrsneVKGZgNYNlkK8W3ssCUSLyiL06l/cv/406aMcxLZcUb/wZW1p4UrpEVGjQN68eIh
         gazN69EOPahWQzBm/EqOqHY+EQqq5hotUOMbDXwQaCoz/cV1/J0mCA0N2XH//2bf75Ki
         aKmelLIj0QBq9QgbMH29g5T0vXYAeDbp302OKg3AoanOIZNnCSldqtBtsB8SU3mljY+k
         I8na3S2TETg/RGb+lMridKvA+cxRuS/VApvOMVuEHhS1DrWG3Z/4HaRU5p6wl/p8zuQ1
         XOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679993325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EU0PyNq3O8MZWQ5fwe8D0KcNrdW4uSY2h1xR6nDBTY=;
        b=aUc3Mq4Y/O1Ve9u/7Tqr8+lIIJwLIzy1Q0s8U5LkVFOhjLmTrxgcGvZJzUpPV6NUb7
         9acxS2WS5W7zvIihwTt8MG0ojlXxFXo9QT7c1XtuZOHSSm8dE4TCVwtUpFPcfdpVpQLa
         VI1eI1EWS1RJMuLiAG3B8Uv1yaJK7Ka27fjEqSxo2LhZAsT7YiijZ3CbsNDx7MPvaOX2
         Subpej+Hm9BoXDgXJG2WY7o1Qu/tMvB157HmAPErAu1gMDgfFO07UlaQ7pM0Yu0xzn6l
         G9nEmH9HKAgbQ64ZaOfTj13i8tsrUHuzhLYvkW6BEdm5ZBeEPYTkvnliZH3Y9XsxCNC9
         bx0Q==
X-Gm-Message-State: AAQBX9fKpSIsNxTlvU2Hvsu16b4nGUMEW7gY9mtMcG1H+1k3yuoBUjc/
	wi5epZs+kncJPxAO4YLMwwI=
X-Google-Smtp-Source: AKy350bDFGo2uIQNJg8uJdqaz7Tcc+lLE2OM3k8eagzfuLp08YrhaAwCSltX2PHBSqX3FPQ+08YONA==
X-Received: by 2002:a17:90b:4f89:b0:23c:fb54:95d5 with SMTP id qe9-20020a17090b4f8900b0023cfb5495d5mr16211336pjb.41.1679993325434;
        Tue, 28 Mar 2023 01:48:45 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-54.three.co.id. [116.206.28.54])
        by smtp.gmail.com with ESMTPSA id n8-20020a6563c8000000b0050f9b7e64fasm13366907pgv.77.2023.03.28.01.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 01:48:45 -0700 (PDT)
Message-ID: <fb1352ba-69a8-c1cc-7d72-43836f412e3d@gmail.com>
Date: Tue, 28 Mar 2023 15:48:42 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/4] staging: rtl8192u: add '*/' on separate line in
 block comments
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jerry Chuang <jerry-chuang@realtek.com>
References: <cover.1679945728.git.kamrankhadijadj@gmail.com>
 <140e0928531e61dc7396271a5b16a6be17514c76.1679945728.git.kamrankhadijadj@gmail.com>
 <ZCJepCj9JcOQqp0Z@debian.me> <ZCJ2_PuvCUBvlwaL@kroah.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ZCJ2_PuvCUBvlwaL@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/28/23 12:11, Greg KH wrote:
>> While at above can you please turn these comments above into kernel-doc
>> comments (see Documentation/doc-guide/kernel-doc.rst for how to write
>> one)? This requires a placeholder doc where you can write e.g. overview
>> of the driver and how it is used. The doc should be in
>> Documentation/driver-api/staging/ (since this is staging driver).
> 
> No, these are static functions, or just normal internal-to-the-driver
> functions, they do not need kerneldoc or any Documentation/* entries,
> sorry.
> 

Ah! I don't see the context behind the comments, thanks anyway!

-- 
An old man doll... just what I always wanted! - Clara

