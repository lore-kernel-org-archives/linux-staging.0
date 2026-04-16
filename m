Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4631B390CB4
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338981; cv=pass; b=RMj9UL+a5PXUeAF7UdGI68TivqNNjgaguw5342Aj6JPLQ16fhMGXPvhBYRFrFvFDXOTp17VOZRLw7d6bWbVmjqFw1QklXcFUOfNuTOjIQYwgk2d8Qa1xUfSuuRaGOfhlWqFYyAQlOQUzaVphvz5d7HrqrJWMXdA8a8KXl014oSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338981; c=relaxed/simple;
	bh=m7BhGgKxP1Qfk5FEdVk7vp4teL8ssgsPPVCZ/A4TVsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeSMLjrb06uKB3EEiO1Au9bZ1o8V2ZtzAVVTUeUDod/U7xw/pPSzdy2nQ1ovM7Q+21O/E0AetdbQfmcHgGZt4eHOCLJdPT4guQtC8KshHxYlaRwuKD7wbObbgZd/ggecVEWdQUiyWxK9GCofIL9f8U9Axkx4Q2VGfxGTRFmP7ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=v2gXf9ef; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="v2gXf9ef"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fxG4w19QpzyQw;
	Thu, 16 Apr 2026 14:29:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776338976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qo2RUEsEnIYZUwCn69pB4Vhx8drBztzYCjDgMV/Qq0w=;
	b=v2gXf9efxOnP8XM0ja7ZtVva9FyfIhjZRGtJWGfP7ZS4E2ETlYRuCkmGJHaLniVi4moFkB
	+o9wp9Zs9MB/F0/WMqTlcAzh3+tiQHkJrVxFPKhj1imy/0UwOh4TNNj/nzkUjV9IkQhV4l
	KVYowA7KA8imL3CcOoZrKCJKD0r93Ag=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776338976;
	b=g1eAnj03wdJ1RWzroO7w8ii/e///s71CoCK0hp7lRIsY9QOFjshfZri08w1/H7tAIV7gb3
	M0mmC1RQ7Mnfeslk3z37exki9PSGA7FgsO9kq6KX2nT0yYNXuprepqOUJNA2N0KSlPpsJn
	WpqUv7/62y1Lc7zU2JgGNpo7nRxWhB8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776338976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qo2RUEsEnIYZUwCn69pB4Vhx8drBztzYCjDgMV/Qq0w=;
	b=OvRpAv/8f6m+ngpi1oaZnUUwR+SkHB30KU46hnx97Wrd5Hkd4iX192nMaZO/N44jsBGLD7
	X1UewbD9SDAep9D9o0wBnFGTyTBCq+E5fvTiHQ/7bNzZgdqAU0nRW8Bxn1o/KbFkJCP4f3
	z8CjSrEw0K4RthCIg703aO+hbuL5W6A=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BFC7D634C4E;
	Thu, 16 Apr 2026 14:29:35 +0300 (EEST)
Date: Thu, 16 Apr 2026 14:29:35 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: fix block comment style in
 circbuf.c
Message-ID: <aeDIH_8wm7UKE5e6@valkosipuli.retiisi.eu>
References: <20260310151620.905-1-rayfraytech@gmail.com>
 <20260310191502.1354-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310191502.1354-1-rayfraytech@gmail.com>

Hi Oskar,

Thanks for the patch.

On Tue, Mar 10, 2026 at 08:15:02PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to comply with kernel coding style:
> - Move text from opening '/*' line to a separate continuation line
> - Add leading '*' on continuation lines
> - Move trailing '*/' to a separate line
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---
>  .../media/atomisp/pci/base/circbuf/src/circbuf.c     | 12 ++++++++----

This no longer applies to my atomisp branch
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=atomisp>. :-(

-- 
Kind regards,

Sakari Ailus
