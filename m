Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8834D35E92D;
	Tue, 24 Mar 2026 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339751; cv=none; b=NxiySLx57xq+bi5P9Dkw7y4I+c0l126mk2ETdDMY3diFx2b0HjJbL8Lq5GHLAWrW5SRkrixJnTg+v9Kjip0caATco3is0Gd3kEJ0yG/im695fa7Ydtn4qL3FmjK43/JDmXBPiHMWzBekP6HXTFFXhN4IW0Q6DDTKurZF8dJnogI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339751; c=relaxed/simple;
	bh=ik3Jyx2LrSAg/CobTwJRnMqo4DXjnZ0q1tRWsxKLlXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdixZ50gF19Bfq3Nr+PmM45CL6SS2uOfEErgX7KFx8VQbhdI6T7GKc94nk/oXNyFJPED3Ht0KZ6myfyRQFHtfqzTWCqH7/oBRbY5AdIK02nMvUJ1h/wEB62gans1iK/qoNhjAp6eto60CAWaL2mnHhhWtN3vKar/zS6qOLOeLSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowAAXv2qYRsJpsM77Cg--.28498S2;
	Tue, 24 Mar 2026 16:08:56 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Maxime Ripard <mripard@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: validate H.264 reference list indices
Date: Tue, 24 Mar 2026 16:08:56 +0800
Message-ID: <20260324080856.56776-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
References: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAXv2qYRsJpsM77Cg--.28498S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYP7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87
	Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14
	v26r1q6r43MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjsmR7UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi Jernej,

Thanks, that makes sense.

You're right that rejecting the H.264 slice control in cedrus_try_ctrl()
would have the same userspace compatibility problem as the HEVC case.
I'll drop that approach and respin this as a separate Cedrus patch that
skips out-of-range reference list indices at the point where
_cedrus_write_ref_list() resolves them into decode->dpb[] entries.

Best regards,
Pengpeng

