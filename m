Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376D3614F
	for <linux-staging@lists.linux.dev>; Sat, 12 Mar 2022 21:43:13 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id bt26so20919539lfb.3
        for <linux-staging@lists.linux.dev>; Sat, 12 Mar 2022 13:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gkrxwfNAo+wqaPPhsyYAGfR02IOHUYddLvZA6FjMTBI=;
        b=FxJI0HFe2HmQgNZiUkdK9qEcNJJeSgk4FpoWUuXVXhAG8PE6Z/+Wb1cQUhO8D8Oltz
         gpa3xaJ5I7fTr48Jxvxm8vFopvlo5SnVkTZk5zQA3NjrSol6HjXqCryzaIJ+Jt3TBQqn
         IePtH5560IjsGAuL0JrBmszuiytvSoJTC8hZ2cjUzx+qYnybpYijooYq5UH7JkZo/pjM
         broSIP1ct1Rz7ddFtS/rUhUxLtIwPjZ810pO3bERK2Bv+jNzNuq9R4IKkAFOG59hXOyt
         DYPiwdT6WPd4flHWLoEc+CxIAUC8YdNFHxBIHNBbAQY1+OFU/mp5dFWNMOc6RL0VuJDH
         IWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gkrxwfNAo+wqaPPhsyYAGfR02IOHUYddLvZA6FjMTBI=;
        b=gkzu9wZyzoRIhCYFR8KklukVSP4LRP1LLSolIjXkxo1ZLu0mvuJflVOtCsut465oHW
         7Aq9yG7o9QjKO3aXZR7+nPMt6+9msMQgUJM3ZDam1hGRAKGRw8TnkhmGV9vbXoOcg6uH
         NQqVbHfslc41Izh71BlQMshFpxTqatHMp394p84LdePdk5p9dN3f8XMUJaZnXF1a/wYN
         mZtAG6K+ZXs8+KdEmywdHHLg2sAVqR3hXpZBhYq05za+ufwSANi8wbISeuI0N1QsMC7i
         nxNkFE0ATp8AoUBc1XNWdTLjartGZ70ILrQzy2Ntm7R7HRxHbD4c6IUjiJw6S7lx6+uN
         nc7g==
X-Gm-Message-State: AOAM532zc5oDoxCDCwgcTGvQU0GBIi1uU9dxtRClhpZ4iAZBHXbqppBC
	T6ABT/OoYvP9xQBF7L92UCk=
X-Google-Smtp-Source: ABdhPJyU1EdFdwFwd3jDaeaQazah7k5dV1l8H1XNs9zkmyWxayD1F82B8UB6lKU9gFsSZO5K14fjiQ==
X-Received: by 2002:a05:6512:2316:b0:446:a84a:173e with SMTP id o22-20020a056512231600b00446a84a173emr8994713lfu.73.1647121390992;
        Sat, 12 Mar 2022 13:43:10 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.107])
        by smtp.gmail.com with ESMTPSA id b1-20020ac247e1000000b0044842b76861sm2377192lfp.140.2022.03.12.13.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Mar 2022 13:43:10 -0800 (PST)
Message-ID: <303ed0c8-8e2c-51a4-a4da-be973a25cdec@gmail.com>
Date: Sun, 13 Mar 2022 00:43:08 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] staging: android: ashmem: Declared file operation with
 const keyword Warning found by checkpatch.pl script.
Content-Language: en-US
To: shaikh kamal <shaikhkamal2012@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>, Hridya Valsaraju
 <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220312204128.3942-1-shaikhkamal2012@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220312204128.3942-1-shaikhkamal2012@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shaikh,

On 3/12/22 23:41, shaikh kamal wrote:
> Signed-off-by: shaikh kamal <shaikhkamal2012@gmail.com>
> ---
>   drivers/staging/android/ashmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> index ddbde3f8430e..4c6b420fbf4d 100644
> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
>   
>   static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>   {
> -	static struct file_operations vmfile_fops;
> +	static const struct file_operations vmfile_fops;
>   	struct ashmem_area *asma = file->private_data;
>   	int ret = 0;
>   

Are you sure this patch compiles? vmfile_fops is overrided few lines below

odd checkpatch.pl warning...




With regards,
Pavel Skripkin
