Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335133B4EB5
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863346; cv=none; b=Tz3PajXJFugneZJwiqfO8uGTJWqpf7x3YZ05lLMlEoPFSpmY0j9IQiOJfWD6X8jSNzCJ911tqniI/w/jYsOkDn7LE4IInXbzVyFAm/UmDPbJOgcGYVzRwZkyc7v89mxvlh3bMmvIkpbXqL8yg2FXeU/ljmIuI06C54T1ZPe3Wac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863346; c=relaxed/simple;
	bh=ScIYdhbbc3S6wXP2zS6nJPqGBJuR2rPC7YTZBOcorN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xqg6YD2uqUF6RUdMURR55tN5C8HGfIqWmOMAC3tJ7OzPZwWM9JBm5ujJMosBN5Zu0/DSgnHxZoSmVwxmDvGAyJ4oGdJvuYcu+aKIHh3orfoExxRZZCzmPITVZpTovYDfA//OCcerCqjcsnTkLfyJ3UNcbIj0DVgYIPpnqUd47Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHEIjNK2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHEIjNK2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8f97c626aaso796307266b.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863344; x=1775468144; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yqt/KzG8wSyNMJ0qMnpzSW0UlcxWVMr3nXTMaERqqZk=;
        b=QHEIjNK2z4x1+tJhyR4DZMKVrSfQ6r4XFC5BRw87q/+XOK7AKtSGTTRFaDW1SqJCYy
         H4WvOSvmuF3e6k4camXbeslFH82SkLpSG3GpvbBsmEd3XnYZJZktJBtDEFbTkxqGw390
         /sx6Xv+zeb0T9fxL3GAdMlkRb4i5sV79av1Nu+l6FERowxU7nWRuULSsyI5G/G0xpEvj
         cuFZq5Y2QhxiHothlJ1K9DSAgcvcgsaEixZL+fF6lg+9eIKlccJTf0QVAyzOFTKBIdlm
         Yj8IiXd95F6j5thHfOukj8rWgSUG2F6JP/5/pCXMP23yC6dzCpJpFCo/zoMUoR+NrTqC
         Zfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863344; x=1775468144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yqt/KzG8wSyNMJ0qMnpzSW0UlcxWVMr3nXTMaERqqZk=;
        b=bHvMEbh/E/ZG/iWXyKWAq4neYtsB6QUDv1Vv3g3snYte8YmL8HE+Nl4M2qJ0c3TVpd
         qGB0gLvp0KVKEAXX0Gobu2GGyqmCT+tk6/o9uj7YUTaETynrbf+qXf0MW2YYBmeWfFy5
         K8DUhIF9HXxFE4wtclFzO+0fbCxuiaHnTzx1HQZVV+W+aB8H3aAwjneWQQIIPXR2bclm
         AL8TIFR1S4uDGv4YueBeLlD4rDr3OHyT1hgs4DFpT7VBBLAkIJSzyX+nuO07aeDZaiW2
         ilH/fzrMKD8k/mqIi+R759dgjYvkTln8MvKqwWALukCOEWMvxjZUI8j/8HqlSrFMOsS9
         ErIA==
X-Forwarded-Encrypted: i=1; AJvYcCVShXpcxIOImcMWcsNhEg3j4old5yDTPuIbQBlVekLiVSehsrhRbltaHLuXiLhKOl5OZED14NxMOfk++/vp@lists.linux.dev
X-Gm-Message-State: AOJu0YxqUAwDTpKoq02CLCtp9mtE9QINTmEpRzXMQjK4/7EZhIRw6Ah6
	bZr6QhYBrCMUusv9AtE5xU6cH/F1tyUfQFliTkn7DR4jNS+4EcH837HF
X-Gm-Gg: ATEYQzxAgcdf1jmRrRCq7JaxLVK95QtgqNXC64uI7ICQLS+9v+mKwK4WAyEzJABNB6D
	WHXJlggBt9fYM42AVuawdglhtrtnLFmnWYjKjxQGBhD36cBxm2UbdW/OmD7+YLxC+eBMJq6QtKw
	gjuAmWvTLpIkTIuXyI0XWklxXOpmvWPiukszn2bwQPbV4Vq9xfj9YZd33e3n3F4uHDKG5yLhOl9
	0P4UUPUFq9N5oUwQPz9HAmiKTb2YZlT7CeZjJk5CyZmSCEa1vqZYpeVIudeU7MdM5rKmzz5b4+N
	dwiGsiTluf4URJUu+hY/jEeTjb3Bg0CSJJvXfezvWzXZ+WfWHlSshi8NpzST0JgQ0+IdF8/lFFT
	Yqp/duTBgP2ruC5RAYbMYLlcEmjx2RQwZICSSdf4ckOk8SsJxythQ0twpg/TA5Wdy7ECTpGhU9n
	fjxoCRzmSdtC4lbVeb8eU=
X-Received: by 2002:a17:906:6a20:b0:b98:4a7a:d5f8 with SMTP id a640c23a62f3a-b9b508e9434mr695110766b.46.1774863343418;
        Mon, 30 Mar 2026 02:35:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae2415csm273220666b.9.2026.03.30.02.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:42 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Xiyuan Guo <tommyguo039@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Xiyuan Guo <tommyguo024@outlook.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase warning for READ_MACREG
Message-ID: <acos5kM-5hK8--rd@stanley.mountain>
References: <20260329045447.49789-1-tommyguo039@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329045447.49789-1-tommyguo039@gmail.com>

On Sun, Mar 29, 2026 at 12:54:47AM -0400, Xiyuan Guo wrote:
> Rename the _Read_MACREG macro to READ_MACREG to resolve the
> checkpatch.pl "Avoid CamelCase" warning.
> 

The patch does a number of other unrelated white space changes as well.

regards,
dan carpenter

