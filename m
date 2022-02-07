Received: from relay3.hostedemail.com (relay3.hostedemail.com [64.99.140.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC082F27
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 06:32:22 +0000 (UTC)
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay11.hostedemail.com (Postfix) with ESMTP id 10DEC80294;
	Mon,  7 Feb 2022 06:32:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 086812002E;
	Mon,  7 Feb 2022 06:32:14 +0000 (UTC)
Message-ID: <62a6db49ef29745514b0263b9bb39b5a16f90efe.camel@perches.com>
Subject: Re: [PATCH] Staging : android: Struct file_operations should be
 const
From: Joe Perches <joe@perches.com>
To: Leonardo Araujo <leonardo.aa88@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Date: Sun, 06 Feb 2022 22:32:14 -0800
In-Reply-To: <20220207031711.13644-1-leonardo.aa88@gmail.com>
References: <20220207031711.13644-1-leonardo.aa88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Stat-Signature: 8dikj3qm5jo846ci3kktjr9bssgn3eqo
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 086812002E
X-Spam-Status: No, score=-2.43
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/tJ4keTdXdL28cbp7ERmXh3BWFz4CR16g=
X-HE-Tag: 1644215534-707106

On Mon, 2022-02-07 at 00:17 -0300, Leonardo Araujo wrote:
> From: "Leonardo Araujo" <leonardo.aa88@gmail.com>
> 
> WARNING: struct file_operations should normally be const

Always compile the files modified by a patch before you send it out.

[]
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
[]
> @@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
>  
>  static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>  {
> -	static struct file_operations vmfile_fops;
> +	static const struct file_operations vmfile_fops;
>  	struct ashmem_area *asma = file->private_data;
>  	int ret = 0;
>  

<apply patch>
$ make allyesconfig
$ make drivers/staging/android/ashmem.o
[...]
  CC      drivers/staging/android/ashmem.o
drivers/staging/android/ashmem.c: In function ‘ashmem_mmap’:
drivers/staging/android/ashmem.c:431:37: error: assignment of read-only variable ‘vmfile_fops’
  431 |                         vmfile_fops = *vmfile->f_op;
      |                                     ^
drivers/staging/android/ashmem.c:432:42: error: assignment of member ‘mmap’ in read-only object
  432 |                         vmfile_fops.mmap = ashmem_vmfile_mmap;
      |                                          ^
drivers/staging/android/ashmem.c:433:55: error: assignment of member ‘get_unmapped_area’ in read-only object
  433 |                         vmfile_fops.get_unmapped_area =
      |                                                       ^
make[3]: *** [scripts/Makefile.build:289: drivers/staging/android/ashmem.o] Error 1
make[2]: *** [scripts/Makefile.build:572: drivers/staging/android] Error 2
make[1]: *** [scripts/Makefile.build:572: drivers/staging] Error 2
make: *** [Makefile:1965: drivers] Error 2



